module Main exposing (..)

import Html as Html
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Svg exposing (..)
import Svg.Attributes exposing (..)
import AnimationFrame as Anim
import Keyboard as Key

type alias Model = {
        position : { x : Int, y : Int }
                    }

init = ({ position = {x = 300, y = 300 }}, Cmd.none)

update (KeyMsg keyCode) model = case keyCode of
                        83 -> ({ position = {x = model.position.x , y = model.position.y + 20}}, Cmd.none )
                        87 -> ({ position = {x = model.position.x, y = model.position.y - 20}}, Cmd.none  )
                        68 -> ({ position = {x = model.position.x + 20, y = model.position.y}}, Cmd.none  )
                        65 -> ({ position = {x = model.position.x - 20, y = model.position.y}}, Cmd.none  )
                        _ -> ({ position = {x = model.position.x, y = model.position.y}}, Cmd.none  )

type Msg = KeyMsg Key.KeyCode

view : Model -> Html.Html Msg
view model = let
        posX = toString model.position.x
        posY = toString model.position.y
    in svg [width "600", height "600"]
        [rect [x posX, y posY, width "50", height"50", fill "red"] []]

subscriptions : model -> Sub Msg
subscriptions model = Key.downs KeyMsg

main : Program Never Model Msg
main = Html.program 
        {init = init,
        update = update,
        view = view,
        subscriptions = subscriptions
        }