module Pages.Home_ exposing (view)

import Gen.Route as Route exposing (Route)
import Html exposing (Html, a, div, footer, header, section, text)
import Html.Attributes exposing (class, href)
import Pages.About exposing (Msg)
import View exposing (View)
import Html exposing (p)
import UI


view : View msg
view =
    { title = "HayaoのHomepage"
    , body = [ UI.layout "HayaoのHomePage" Route.Home_ content ]
    }

content : Html msg
content =
    section [ class "section is-large" ]
        [ div [ class "container" ]
            [ p [ class "title" ] [ text "Welcome To Hayao's Portfolio" ]
            , p [ class "substitute" ] [ text "I am an IT engineer before running out." ]
            ]
        ]
