module Main exposing (..)

import Html exposing (..)
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Svg exposing (..)
import Svg.Attributes exposing (..)
import AnimationFrame as Anim
import Keyboard as Key
import Html.Events exposing (onClick)
import Random
import Time exposing (Time, second)                     -- EXPOSE EVERYTHING
import Task exposing (..)
import Window
import Mouse exposing (..)
import Html.Attributes as Attr

full = "100%"
myWidth = "70"
myHeight = "30"
emptyBox = "fill:none;stroke:black;stroke-width:5;opacity:0.1"


type Msg = KeyMsg Key.KeyCode | Tick Float | Roll | OnResult Int | SizeUpdated Window.Size | Click

type alias Model = {
        position : { x : Float, y : Float },
        myTime   : {currentTime : Time},
        dangerOne: {x:Int, y:Int},
        dangerTwo: {x:Int, y:Int},
        dangerThree: {x:Int, y:Int},
        dangerFour: {x:Int, y:Int},
        dangerFive: {x:Int, y:Int},
        borderDims : {x:Float,y:Float},
        randomNumb : Int,
        dimensions : Window.Size,
        gameState : Int,
        momentium : Float,
        myScore : Float
                   }

init = ({ position = {x = 300, y = 300 },
    myTime = {currentTime = 0},
    dangerOne = {x = 1100, y = 200},
    dangerTwo = {x = 700, y = 300},
    dangerThree = {x = 800, y = 400},
    dangerFour = {x = 600, y = 200}, 
    dangerFive = {x = 850, y = 500},
    borderDims = {x = 220, y = 15 },
    randomNumb = 0,
    dimensions = Window.Size 0 0,
    gameState = 1,
    momentium = 0,
    myScore = 0},
    Task.perform SizeUpdated Window.size)

update msg model = case msg of
    (KeyMsg keyCode) -> case keyCode of
            --68 -> ({ model | position = {x = model.position.x,y=model.position.y+20}}, Random.generate OnResult (Random.int 0 10)  ) --We grab a new random here since doing so using time would be too rapid
           -- 65 -> ({ model | position = {x = model.position.x,y=model.position.y-20}}, Random.generate OnResult (Random.int 0 10)  )
            _  -> ({model | momentium = model.momentium - 4}, Random.generate OnResult (Random.int 0 10)  )
    Tick newTime ->
        timeTick model
    Roll ->
        ( model, Random.generate OnResult (Random.int 0 10) )
    OnResult res ->
        ( {model | randomNumb = res}, Cmd.none )
    SizeUpdated dimensions ->
        ({ model | dimensions = dimensions }, Cmd.none )
    Click ->
        ({model | gameState = 1}, Cmd.none)


timeTick : Model -> ( Model, Cmd Msg )
timeTick model =
        ( model )
        |> wrapCmd
        |> updateBorderDims
      --  |> updateRandom     --Updates too often
        |> moveStuff
        |> updateScore
        |> moveStuffTwo
        |> moveStuffThree
        |> moveStuffFour
        |> moveStuffFive
        |> wrapStuff
        |> wrapStuffTwo
        |> wrapStuffThree
        |> wrapStuffFour
        |> wrapStuffFive
        |> checkHit
        |> checkHitTwo
        |> checkHitThree
        |> checkHitFour
        |> checkHitFive
        |> gravity
        |> movePlayer
        |> checkPlayer


updateScore:(Model, Cmd Msg) -> (Model, Cmd Msg)
updateScore (model,cmd) = if (model.gameState == 1) then
    ({model | myScore = model.myScore + 0.25}, Cmd.none)
    else
        (model, Cmd.none)

checkPlayer:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkPlayer (model,cmd) = if ((model.position.x) < model.borderDims.x) || ((model.position.x) > model.borderDims.x + 1000) || ((model.position.y) < model.borderDims.y) || ((model.position.y) > model.borderDims.y + 700) then
    ({model | gameState = 2},Cmd.none)
    else
        (model,Cmd.none)

gravity:(Model, Cmd Msg) -> (Model, Cmd Msg)
gravity (model,cmd) = ({model | momentium = model.momentium + 0.25},Cmd.none)

movePlayer:(Model, Cmd Msg) -> (Model, Cmd Msg)
movePlayer (model,cmd) = ({model| position = {x = model.position.x, y = model.position.y + model.momentium}}, Cmd.none)

checkHit:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkHit (model,cmd) = if ((abs ((round model.position.x) - model.dangerOne.x) < 70) && (abs ((round model.position.y) - model.dangerOne.y) < 30)) then ({ model | gameState = 2 }, Cmd.none ) else (model, Cmd.none)

checkHitTwo:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkHitTwo (model,cmd) = if ((abs ((round model.position.x) - model.dangerTwo.x) < 70) && (abs ((round model.position.y) - model.dangerTwo.y) < 30)) then ({ model | gameState = 2 }, Cmd.none ) else (model, Cmd.none)

checkHitThree:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkHitThree (model,cmd) = if ((abs ((round model.position.x) - model.dangerThree.x) < 70) && (abs ((round model.position.y) - model.dangerThree.y) < 30)) then ({ model | gameState = 2 }, Cmd.none ) else (model, Cmd.none)

checkHitFour:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkHitFour (model,cmd) = if ((abs ((round model.position.x) - model.dangerFour.x) < 70) && (abs ((round model.position.y) - model.dangerFour.y) < 30)) then ({ model | gameState = 2 }, Cmd.none ) else (model, Cmd.none)

checkHitFive:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkHitFive (model,cmd) = if ((abs ((round model.position.x) - model.dangerFive.x) < 70) && (abs ((round model.position.y) - model.dangerFive.y) < 30)) then ({ model | gameState = 2 }, Cmd.none ) else (model, Cmd.none)

updateRandom:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
updateRandom (model, cmd) =  (update Roll model)

moveStuff:(Model, Cmd Msg) -> (Model, Cmd Msg)
moveStuff (model,cmd) = ({model | dangerOne = {x = model.dangerOne.x - 3, y=model.dangerOne.y}}, Cmd.none)

moveStuffTwo:(Model, Cmd Msg) -> (Model, Cmd Msg)
moveStuffTwo (model,cmd) = ({model | dangerTwo = {x = model.dangerTwo.x - 3, y=model.dangerTwo.y}}, Cmd.none)

moveStuffThree:(Model, Cmd Msg) -> (Model, Cmd Msg)
moveStuffThree (model,cmd) = ({model | dangerThree = {x = model.dangerThree.x - 3, y=model.dangerThree.y}}, Cmd.none)

moveStuffFour:(Model, Cmd Msg) -> (Model, Cmd Msg)
moveStuffFour (model,cmd) = ({model | dangerFour = {x = model.dangerFour.x - 3, y=model.dangerFour.y}}, Cmd.none)

moveStuffFive:(Model, Cmd Msg) -> (Model, Cmd Msg)
moveStuffFive (model,cmd) = ({model | dangerFive = {x = model.dangerFive.x - 3, y=model.dangerFive.y}}, Cmd.none)

wrapCmd:Model -> ( Model, Cmd Msg )
wrapCmd model = (model, Cmd.none)

updateBorderDims:(Model, Cmd Msg) -> (Model, Cmd Msg)
updateBorderDims (model, cmd) = ({ model | borderDims = {x = (getWidth (model.dimensions)/7)  ,y=(getHeight (model.dimensions)/50)}}, Cmd.none)

wrapStuff:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
wrapStuff (model, cmd) = 
    if ((toFloat model.dangerOne.x) < model.borderDims.x) 
    then ({ model | dangerOne = {x = 1000, y = ((round model.borderDims.y) + model.randomNumb*50)}}, Cmd.none) 
    else (model, Cmd.none  )

wrapStuffTwo:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
wrapStuffTwo (model, cmd) = 
    if ((toFloat model.dangerTwo.x) < model.borderDims.x) 
    then ({ model | dangerTwo = {x = 1000, y = ((round model.borderDims.y) + model.randomNumb*50)}}, Cmd.none) 
    else (model, Cmd.none)

wrapStuffThree:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
wrapStuffThree (model, cmd) = 
    if ((toFloat model.dangerThree.x) < model.borderDims.x) 
    then ({ model | dangerThree = {x = 1000, y = ((round model.borderDims.y) + model.randomNumb*50)}}, Cmd.none) 
    else (model, Cmd.none)

wrapStuffFour:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
wrapStuffFour (model, cmd) = 
    if ((toFloat model.dangerFour.x) < model.borderDims.x) 
    then ({ model | dangerFour = {x = 1000, y = ((round model.borderDims.y) + model.randomNumb*50)}}, Cmd.none) 
    else (model, Cmd.none)

wrapStuffFive:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
wrapStuffFive (model, cmd) = 
    if ((toFloat model.dangerFive.x) < model.borderDims.x) 
    then ({ model | dangerFive = {x = 1000, y = ((round model.borderDims.y) + model.randomNumb*50)}}, Cmd.none) 
    else (model, Cmd.none)

view : Model -> Html.Html Msg
view model = let
        posX = toString model.position.x
        posY = toString model.position.y
        moveTo = toString ((toString model.myTime.currentTime))
    in 
    if (model.gameState == 0) then
        svg [width full, height full]  [image [x "0", y "0", width "700", height "700", Svg.Attributes.xlinkHref "./start.png"][]]
    else if (model.gameState == 2)
    then
         div [Attr.align "center"]
         [ h1 [] [Html.text ("Your final score was: " ++ (toString model.myScore))]
         , p [] [Html.text "Press F5 to try again!"]
         ]
    else
           svg [width full, height full]  
            ([]
           ++ [rect [x posX, y posY, width myWidth, height myHeight, fill "red"] []] --Player box
           ++ [rect [x (toString model.dangerOne.x), y (toString model.dangerOne.y), width myWidth, height myHeight, fill "blue"][]] 
           ++ [rect [x (toString model.dangerTwo.x), y (toString model.dangerTwo.y), width myWidth, height myHeight, fill "blue"][]]
           ++ [rect [x (toString model.dangerThree.x), y (toString model.dangerThree.y), width myWidth, height myHeight, fill "blue"][]]
           ++ [rect [x (toString model.dangerFour.x), y (toString model.dangerFour.y), width myWidth, height myHeight, fill "blue"][]]
           ++ [rect [x (toString model.dangerFive.x), y (toString model.dangerFive.y), width myWidth, height myHeight, fill "blue"][]]
           ++ [rect [x (toString model.borderDims.x), y (toString model.borderDims.y), width "1000", height "700", Svg.Attributes.style emptyBox][]])


        
subscriptions : Model -> Sub Msg
subscriptions model = 
     Sub.batch
        [ 
          Key.downs KeyMsg,
          Anim.times Tick,
          Mouse.clicks (\_ -> Click)
        ]
   

main : Program Never Model Msg
main = Html.program 
        {init = init,
        update = update,
        view = view,
        subscriptions = subscriptions
        }


getWidth : Window.Size -> Float
getWidth size = (toFloat (size.width))

getHeight : Window.Size -> Float
getHeight size =  (toFloat (size.height))

windowDimensionsChanged : Sub Msg          --From CharlesZhang99 ToDo add Attrib
windowDimensionsChanged =
    Window.resizes SizeUpdated

