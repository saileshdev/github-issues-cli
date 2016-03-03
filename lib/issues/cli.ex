defmodule Issues.CLI do
  @default_count 4

  @moduledoc """

  Handles the command line parsing to various functions
  that end up generating table of last n issues of a 
  github project

  """
  def run(argv) do
    parse_args(argv)
  end

  @doc """

  'argv' can be -h or --help, which returns :help.

  Otherwise it is a github user name, project name, and optionally
  the no of enteries to format.

  Returns a tuple of '{ user,project,count}', or :help if help was given

  """

  def parse_args(argv) do
  parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])

    case parse do
  
    {[help: true],_,_ } 
    -> :help

    {_,[user, project,count],_}
    -> {user, project, String.to_integer(count)}

    {_,[user, project],_}
    -> {user,project,@default_count}

    _ -> :help

    end
  end

end
  
