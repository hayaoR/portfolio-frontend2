module Pages.Home_ exposing (view)

import Gen.Route as Route
import Html exposing (Html, div, section, text)
import Html.Attributes exposing (class)
import View exposing (View)
import Html exposing (p)
import UI


view : View msg
view =
    { title = "Hayaoのホームページ"
    , body = [ UI.layout "Hayaoのホームページ" Route.Home_ content ]
    }

content : Html msg
content =
    section [ class "section is-large" ]
        [ div [ class "container" ]
            [ p [ class "title" ] [ text "Welcome to Hayao's Portfolio" ]
            , p [ class "substitute" ] [ text "I am an IT engineer before running out." ]
            ]
        ]
