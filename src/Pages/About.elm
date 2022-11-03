module Pages.About exposing (Model, Msg, page)

import Gen.Params.About exposing (Params)
import Gen.Route as Route exposing (Route)
import Html exposing (Html, div, h3, img, p, text)
import Html.Attributes exposing (alt, class, src)
import Http
import Json.Decode exposing (Decoder, string, succeed)
import Json.Decode.Pipeline exposing (required)
import Page
import Request
import Shared exposing (subscriptions)
import UI
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update
        , view = view "Hayaoについて" req.route
        , subscriptions = subscriptions
        }


type Msg
    = GotAbout (Result Http.Error About)


type alias Model =
    { img : String
    , about : About
    }


type alias About =
    { text : String }


aboutDecoder : Decoder About
aboutDecoder =
    succeed About
        |> required "text" string


init : ( Model, Cmd Msg )
init =
    ( { img = "/hayao.jpg", about = About "" }
    , Http.get
        { url = "http://localhost:3000/about"
        , expect = Http.expectJson GotAbout aboutDecoder
        }
    )


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        GotAbout result ->
            case result of
                Ok about ->
                    ( { model | about = about }, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )


view : String -> Route -> Model -> View Msg
view title route model =
    { title = title
    , body = [ UI.layout title route <| body model ]
    }


body model =
    div [ class "section" ]
        [ div [ class "content" ]
            [ div [ class "center" ] [ img [ src model.img, alt "近影", class "hayao" ] [] ]
            , h3 [] [ text "hayao" ]
            , p [] [ text model.about.text ]
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
