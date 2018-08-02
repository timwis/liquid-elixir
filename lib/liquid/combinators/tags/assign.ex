defmodule Liquid.Combinators.Tags.Assign do
  @moduledoc """
  Sets variables in a template
  ```
    {% assign foo = 'monkey' %}
  ```
  User can then use the variables later in the page
  ```
    {{ foo }}
  ```
  """
  import NimbleParsec
  alias Liquid.Combinators.{General, Tag, LexicalToken}

  @type t :: [assign: [variable_name: String.t(), value: LexicalToken.value()]]

  def tag do
    Tag.define_open("assign", fn combinator ->
      combinator
      |> concat(General.assignment(General.codepoints().equal))
      |> optional(General.filters())
    end)
  end
end