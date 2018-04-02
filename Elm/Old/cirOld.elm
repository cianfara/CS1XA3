module MouseExample exposing (..)

import Html as Html
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Mouse as Mouse
import Keyboard as Key
import Svg exposing (..)
import Svg.Attributes exposing (..)
import AnimationFrame as Anim


{- Model -}
type alias Model = { position : (Int,Int), myShape : { x : Int, y : Int } }

init : (Model,Cmd.Cmd Msg)
init = ({ position = (0,0), myShape = {x = 0, y = 0}}, Cmd.none)

{- Update -}
type Msg = MouseMsg Mouse.Position | ResetMsg Key.KeyCode 

update : Msg -> Model -> (Model,Cmd.Cmd Msg)
update msg model =
    case msg of
        MouseMsg pos ->
            ({ position = (pos.x,pos.y), myShape = {x = pos.x, y = pos.y}  },Cmd.none)
        ResetMsg key ->
            ({ position = (0,0), myShape = {x = 100, y = 100}},Cmd.none)


{- View -}
view : Model -> Html.Html Msg
view model = let
      myTxt =  Html.text (toString model.position)
      posX = toString model.myShape.x
      posY = toString model.myShape.y
    in svg [width "600",height "600"]
        [ellipse [cx posX,cy posY, rx "20", ry "10", fill "blue"] []]

{- Subscriptions -}
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Mouse.moves MouseMsg 
        , Key.downs ResetMsg
        ]



{- Main -}
main : Program Never Model Msg
main = Html.program
          { init = init,
            view = view,
            update = update,
            subscriptions = subscriptions
            }
