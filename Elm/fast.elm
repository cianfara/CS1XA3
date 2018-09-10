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
    dangerOne = {x = 700, y = 0},
    dangerTwo = {x = 400, y = 50},
    dangerThree = {x = (-100), y = (-30)},
    dangerFour = {x = (-300), y = 0}, 
    dangerFive = {x = 300, y = 500},
    borderDims = {x = 220, y = 15 },
    randomNumb = 0,
    dimensions = Window.Size 0 0,
    gameState = 0,
    momentium = 0,
    myScore = 0},
    Task.perform SizeUpdated Window.size)

update msg model = case msg of
    (KeyMsg keyCode) -> case keyCode of
             68 -> ({model | momentium = model.momentium + 1}, Random.generate OnResult (Random.int (-5) 5)  ) --For debug
             65 -> ({model | momentium = model.momentium - 1}, Random.generate OnResult (Random.int (-5) 5)  ) --For debug
             _  -> ({model | momentium = model.momentium - 4}, Random.generate OnResult (Random.int (-5) 5)  ) 
    Tick newTime ->
      if (model.gameState == 0) then
        gameMenu model
      else if (model.gameState == 4) then
        initGame model
      else if (model.gameState == 1) then
        timeTick model
      else
        timeTick model
    Roll ->
        ( model, Random.generate OnResult (Random.int (-5) 5) )
    OnResult res ->
        ( {model | randomNumb = res}, Cmd.none )
    SizeUpdated dimensions ->
        ({ model | dimensions = dimensions }, Cmd.none )
    Click ->
        ({model | gameState = 4}, Cmd.none)

initGame : Model -> ( Model, Cmd Msg )
initGame model = ({ position = {x = 300, y = 300 },
    myTime = {currentTime = 0},
    dangerOne = {x = 700, y = 0},
    dangerTwo = {x = 400, y = 50},
    dangerThree = {x = (-100), y = (-30)},
    dangerFour = {x = (-300), y = 0}, 
    dangerFive = {x = 300, y = 500},
    borderDims = {x = 220, y = 15 },
    randomNumb = model.randomNumb,
    dimensions = model.dimensions,
    gameState = 1,
    momentium = 0,
    myScore = 0},
    Cmd.none)

gameMenu : Model -> ( Model, Cmd Msg )
gameMenu model =
            ( model )
            |> wrapCmd
            |> moveStuff
            |> wrapStuff
            |> moveStuffTwo -- Basically just move the pipes for the background
            |> wrapStuffTwo
            |> moveStuffThree
            |> wrapStuffThree
            |> moveStuffFour
            |> wrapStuffFour

timeTick : Model -> ( Model, Cmd Msg )
timeTick model =
            ( model )
            |> wrapCmd
            |> updateBorderDims
            |> updateScore
            |> moveStuff
            |> wrapStuff
            |> checkHit
            |> moveStuffTwo -- Each pipe has three methods (Move,Wrap,Hit)
            |> wrapStuffTwo
            |> checkHitTwo
            |> moveStuffThree
            |> wrapStuffThree
            |> checkHitThree
            |> moveStuffFour
            |> wrapStuffFour
            |> checkHitFour
            |> gravity
            |> movePlayer
            |> checkPlayer
         --   |> debugGame
         
startGame:(Model, Cmd Msg) -> (Model, Cmd Msg)
startGame (model,cmd) = ({model | gameState = 1}, Cmd.none)

debugGame:(Model, Cmd Msg) -> (Model, Cmd Msg)
debugGame (model,cmd) = ({model | dangerFive = {x = (abs ((round model.position.x) - model.dangerOne.x)), y =(abs ((round model.position.y) - model.dangerOne.y))}}, Cmd.none)

updateScore:(Model, Cmd Msg) -> (Model, Cmd Msg)
updateScore (model,cmd) = if (model.gameState == 1) then
    ({model | myScore = model.myScore + 0.25}, Cmd.none)
    else
        (model, Cmd.none)

checkPlayer:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkPlayer (model,cmd) = if ((model.position.x) < model.borderDims.x) || ((model.position.x) > model.borderDims.x + 1000) || ((model.position.y) < model.borderDims.y - 70) || ((model.position.y) > model.borderDims.y + 700) then
    ({model | gameState = 2},Cmd.none)
    else
        (model,Cmd.none)

gravity:(Model, Cmd Msg) -> (Model, Cmd Msg)
gravity (model,cmd) = ({model | momentium = model.momentium + 0.18},Cmd.none)

movePlayer:(Model, Cmd Msg) -> (Model, Cmd Msg)
movePlayer (model,cmd) = ({model| position = {x = model.position.x, y = model.position.y + model.momentium}}, Cmd.none)


checkHit:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkHit (model,cmd) = if (((model.dangerOne.x < 90) && model.dangerOne.x > (-60))
    && 
        ((abs ((round model.position.y) - model.dangerOne.y) < 284 ) || (abs ((round model.position.y) - model.dangerOne.y) > 356 ))) then 
    ({ model | gameState = 2 }, Cmd.none ) 
    else (model, Cmd.none)

checkHitTwo:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkHitTwo (model,cmd) = if (((model.dangerTwo.x < 90) && model.dangerTwo.x > (-60))
    && 
        ((abs ((round model.position.y) - model.dangerTwo.y) < 284 ) || (abs ((round model.position.y) - model.dangerTwo.y) > 356 ))) then 
    ({ model | gameState = 2 }, Cmd.none ) 
    else (model, Cmd.none)

checkHitThree:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkHitThree (model,cmd) = if (((model.dangerThree.x < 90) && model.dangerThree.x > (-60))
    && 
        ((abs ((round model.position.y) - model.dangerThree.y) < 284 ) || (abs ((round model.position.y) - model.dangerThree.y) > 356 ))) then 
    ({ model | gameState = 2 }, Cmd.none ) 
    else (model, Cmd.none)

checkHitFour:(Model, Cmd Msg) -> (Model, Cmd Msg)
checkHitFour (model,cmd) = if (((model.dangerFour.x < 90) && model.dangerFour.x > (-60))
    && 
        ((abs ((round model.position.y) - model.dangerFour.y) < 284 ) || (abs ((round model.position.y) - model.dangerFour.y) > 356 ))) then 
    ({ model | gameState = 2 }, Cmd.none ) 
    else (model, Cmd.none)

updateRandom:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
updateRandom (model, cmd) =  (update Roll model)

moveStuff:(Model, Cmd Msg) -> (Model, Cmd Msg)
moveStuff (model,cmd) = ({model | dangerOne = {x = model.dangerOne.x - 30, y=model.dangerOne.y}}, Cmd.none)

moveStuffTwo:(Model, Cmd Msg) -> (Model, Cmd Msg)
moveStuffTwo (model,cmd) = ({model | dangerTwo = {x = model.dangerTwo.x - 30, y=model.dangerTwo.y}}, Cmd.none)

moveStuffThree:(Model, Cmd Msg) -> (Model, Cmd Msg)
moveStuffThree (model,cmd) = ({model | dangerThree = {x = model.dangerThree.x - 30, y=model.dangerThree.y}}, Cmd.none)

moveStuffFour:(Model, Cmd Msg) -> (Model, Cmd Msg)
moveStuffFour (model,cmd) = ({model | dangerFour = {x = model.dangerFour.x - 30, y=model.dangerFour.y}}, Cmd.none)

wrapCmd:Model -> ( Model, Cmd Msg )
wrapCmd model = (model, Cmd.none)

updateBorderDims:(Model, Cmd Msg) -> (Model, Cmd Msg)
updateBorderDims (model, cmd) = ({ model | borderDims = {x = (getWidth (model.dimensions))/7  ,y=(getHeight (model.dimensions))/50}}, Cmd.none)

wrapStuff:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
wrapStuff (model, cmd) = 
    if ((toFloat model.dangerOne.x) < model.borderDims.x - 700) 
    then ({ model | dangerOne = {x = 1200, y = (0 + model.randomNumb*15)}}, Cmd.none) 
    else (model, Cmd.none)

wrapStuffTwo:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
wrapStuffTwo (model, cmd) = 
    if ((toFloat model.dangerTwo.x) < model.borderDims.x - 700) 
    then ({ model | dangerTwo = {x = 1200, y = (0 + model.randomNumb*20)}}, Cmd.none) 
    else (model, Cmd.none)

wrapStuffThree:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
wrapStuffThree (model, cmd) = 
    if ((toFloat model.dangerThree.x) < model.borderDims.x - 700) 
    then ({ model | dangerThree = {x = 1200, y = (0 + model.randomNumb*20)}}, Cmd.none) 
    else (model, Cmd.none)

wrapStuffFour:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
wrapStuffFour (model, cmd) = 
    if ((toFloat model.dangerFour.x) < model.borderDims.x - 700) 
    then ({ model | dangerFour = {x = 1200, y = (0 + model.randomNumb*20)}}, Cmd.none) 
    else (model, Cmd.none)

view : Model -> Html.Html Msg
view model = let
        posX = toString model.position.x
       -- posY = toString model.dangerFour.x
        posY = toString model.position.y
        moveTo = toString ((toString model.myTime.currentTime))
        pipeSize = toString (176*4)
        pipeHeight = toString (260*4)
        pipeOffset = toString ((-200) + model.dangerOne.y)
        pipeOffsetTwo = toString ((-200) + model.dangerTwo.y)
        pipeOffsetThree = toString ((-200) + model.dangerThree.y)
        pipeOffsetFour = toString ((-200) + model.dangerFour.y)
    in 
           div [] 
           [
           if (model.gameState == 2) then
            div [Attr.align "center"]
         [ h1 [] [Html.text ("Your final score was: " ++ (toString model.myScore))]
         , p [] [Html.text "Click to restart!"]
         ]
           else 
            div [] []
           ,svg [width ((toString (model.borderDims.x*7))), height ((toString ((model.borderDims.y*50)-4)))]  
          ([image [x "0", y "0", width "100%", height "100%", Svg.Attributes.xlinkHref "./background.png"][]]
              --++ [image [x "800", y "200", width "350", height "375", Svg.Attributes.xlinkHref "./pipeUP.png"][]]
              ++ [image [x (toString model.dangerOne.x), y pipeOffset, width pipeSize, height pipeHeight, Svg.Attributes.xlinkHref "./newPipe.png"][]]
              ++ [image [x (toString model.dangerTwo.x), y pipeOffsetTwo, width pipeSize, height pipeHeight, Svg.Attributes.xlinkHref "./newPipe.png"][]]
              ++ [image [x (toString model.dangerThree.x), y pipeOffsetThree, width pipeSize, height pipeHeight, Svg.Attributes.xlinkHref "./newPipe.png"][]]
              ++ [image [x (toString model.dangerFour.x), y pipeOffsetFour, width pipeSize, height pipeHeight, Svg.Attributes.xlinkHref "./newPipe.png"][]]
              ++ if (model.gameState==0) then [image [x "425", y "0", width "658", height "370.3", Svg.Attributes.xlinkHref "./flappy-bird.svg"][]] 
              ++ [image [x "450", y "300", width "658", height ((toString ((model.borderDims.y*50)-50))), Svg.Attributes.xlinkHref "./startText.png"][]] else []
              ++ if (model.gameState==1) then [image [x posX, y posY, width "140", height "80", Svg.Attributes.xlinkHref "./bird.png"][]] else []
              )]


-- Offset, Collision

           -- ([]
          -- ++ [rect [x posX, y posY, width myWidth, height myHeight, fill "red"] []] --Player box
         --  ++ [rect [x (toString model.dangerOne.x), y (toString model.dangerOne.y), width myWidth, height myHeight, fill "blue"][]] 
        --   ++ [rect [x (toString model.borderDims.x), y (toString model.borderDims.y), width "1000", height "700", Svg.Attributes.style emptyBox][]])


              
              

        
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

