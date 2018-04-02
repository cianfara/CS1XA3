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
type Msg = MouseMsg Mouse.Position | ResetMsg Key.KeyCode | KeyMsg Key.KeyCode

update : Msg -> Model -> (Model,Cmd.Cmd Msg)
update msg model =
    case msg of
        MouseMsg pos ->
            ({ position = (pos.x,pos.y), myShape = {x = pos.x, y = pos.y}  },Cmd.none)
        ResetMsg key ->
            ({ position = (0,0), myShape = {x = 300, y = 300}},Cmd.none)
        KeyMsg pkey ->
            case pkey of --left right up down
                37 -> ((addUp model),Cmd.none)

addUp model = ({ position = (0,0), model | {x = model.myShape.x-1,y = model.myShape.y-1)},Cmd.none)

view : Model -> Html.Html Msg
view model = let
      myTxt =  Html.text (toString model.position)
      posX = toString model.myShape.x
      posY = toString model.myShape.y
    in svg [width "600",height "600"]
        [ellipse [cx posX,cy posY, rx "10", ry "20", fill "blue"] []]

{- Subscriptions -}
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Mouse.moves MouseMsg 
        , Key.downs ResetMsg
        , Key.downs KeyMsg
        ]



{- Main -}
main : Program Never Model Msg
main = Html.program
          { init = init,
            view = view,
            update = update,
            subscriptions = subscriptions
            }
