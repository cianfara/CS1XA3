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

myWidth = "70"
myHeight = "30"
type Msg = KeyMsg Key.KeyCode

type alias Model = { pos : (Int,Int), randomNum : Int}

init : (Model,Cmd.Cmd Msg)
init = ({ pos = (200,500), randomNum = 0}, Cmd.none)


update msg model = case msg of                                                       --If there is a god then please let no human see this mess
    (KeyMsg keyCode) -> case keyCode of
            68 -> ({pos=((nTou model 0) + 5, (nTou model 1)), randomNum = 0}, Cmd.none )
            65 -> ({pos=((nTou model 0) - 5, (nTou model 1)), randomNum = 0}, Cmd.none )
            _  -> ({pos=((nTou model 0)    , (nTou model 1)), randomNum = 0}, Cmd.none )

nTou p n = (if n==0 then (Tuple.first p.pos) else (Tuple.second p.pos))
fTou p n = toString (if n==0 then (Tuple.first p.pos) else (Tuple.second p.pos))

view : Model -> Html.Html Msg
view model = svg [width "600", height "600"]
        [rect [x (fTou model 0), y (fTou model 1), width myWidth, height myHeight, fill "red"] []]

subscriptions : Model -> Sub Msg
subscriptions model =
     Sub.batch
        [ 
          Key.downs KeyMsg
        ]



main : Program Never Model Msg
main = Html.program 
        {init = init,
        update = update,
        view = view,
        subscriptions = subscriptions
        }