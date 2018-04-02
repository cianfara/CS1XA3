module AdamCianGame exposing (..)

import Html as Html
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Mouse as Mouse
import Keyboard as Key
import Svg exposing (..)
import Svg.Attributes exposing (..)
import AnimationFrame as Anim
import Html.Events exposing (onClick)
import Random



{- Model -}
type alias Model = { position : {x : Int, y : Int} }

init : (Model,Cmd.Cmd Msg)
init = ({ position = {x=0,y=0}}, Cmd.none)

{- Update -}
type Msg = MouseMsg Mouse.Position | KeyMsg Key.KeyCode 

update (KeyMsg keyCode) model = case keyCode of
                        83 -> ({ position = {x = model.position.x , y = model.position.y + 20}}, Cmd.none )
                        87 -> ({ position = {x = model.position.x, y = model.position.y - 20}}, Cmd.none  )
                        _  -> ({ position = {x = model.position.x, y = model.position.y}}, Cmd.none  ) 
{- View -}
view : Model -> Html.Html Msg
view model = svg [width "600",height "600"]
        [rect [x (toString model.position.x),y (toString model.position.y),width "600",height "600", fill "blue"] []]

{- Subscriptions -}
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Mouse.moves MouseMsg 
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


{-
  module RandomExample exposing (..)



-- MODEL
type alias Model =  Int

init : ( Model, Cmd Msg )
init =
    ( 1, Cmd.none )

-- MESSAGES
type Msg
    = Roll
    | OnResult Int

-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Roll ] [ text "Roll" ]
        , text (toString model)
        ]

-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate OnResult (Random.int 1 6) )

        OnResult res ->
            ( res, Cmd.none )

-- MAIN
main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (always Sub.none)
        }
-}