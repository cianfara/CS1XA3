module Main exposing (..)

import Html as Html
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

type Msg = KeyMsg Key.KeyCode | Tick Time | Roll | OnResult Int

type alias Model = {
        position : { x : Int, y : Int },
        myTime   : {currentTime : Time},
        dangerObj: {one:Int, two:Int, three:Int},
        randomNumb : Int
                   }

init = ({ position = {x = 300, y = 300 }, myTime = {currentTime = 0}, dangerObj = {one = 0, two = 0, three = 0}, randomNumb = 0}, Cmd.none)

update msg model = case msg of
    (KeyMsg keyCode) -> case keyCode of
            68 -> ({ model | position = {x = model.position.x + 20,y=model.position.y}}, Cmd.none  )
            65 -> ({ model | position = {x = model.position.x - 20,y=model.position.y}}, Cmd.none  )
            _  -> (model, Cmd.none  )
    Tick newTime ->
        timeTick model
    Roll ->
        ( model, Random.generate OnResult (Random.int 1 6) )
    OnResult res ->
        ( {model | randomNumb = res}, Cmd.none )


updateRandom:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
updateRandom (model, cmd) = (update Roll model)

timeTick : Model -> ( Model, Cmd Msg )
timeTick model =
        ( model )
        |> testStuff
        |> wrapStuff
        |> updateRandom






wrapStuff:( Model, Cmd Msg ) -> ( Model, Cmd Msg )
wrapStuff (model, cmd) = 
    if (model.position.x > 400) 
    then ({ model | position = {x = 300 ,y=model.position.y}}, Cmd.none) 
    else (model, Cmd.none  )

testStuff:Model -> ( Model, Cmd Msg )
testStuff model = ({model | position = {x = model.position.x, y = model.position.y + 5}}, Cmd.none)



myWidth = "70"
myHeight = "30"

view : Model -> Html.Html Msg
view model = let
        posX = toString model.position.x
        posY = toString model.position.y
        moveTo = toString ((toString model.myTime.currentTime))
    in svg [width "600", height "600"]  [rect [x posX, y posY, width myWidth, height myHeight, fill "red"] [], 
       svg [width "600", height "600"]  [rect [x "50", y posY, width "50", height "200", fill "blue"] []]]

subscriptions : Model -> Sub Msg
subscriptions model = 
     Sub.batch
        [ 
          Key.downs KeyMsg,
          Time.every second Tick
        ]
   

main : Program Never Model Msg
main = Html.program 
        {init = init,
        update = update,
        view = view,
        subscriptions = subscriptions
        }

