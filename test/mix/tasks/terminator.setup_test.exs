defmodule Mix.Tasks.TerminatorSetupTest do
  use ExUnit.Case
  import Mock

  test "invokes the Ecto.Migrate task for the Terminator Repo" do
    with_mock Mix.Tasks.Ecto.Migrate, run: fn _params -> nil end do
      Mix.Tasks.Terminator.Setup.run()
      assert_called(Mix.Tasks.Ecto.Migrate.run(["-r", "Terminator.Repo"]))
    end
  end

  test "appends any arguments to the Ecto.Migrate task" do
    with_mock Mix.Tasks.Ecto.Migrate, run: fn _params -> nil end do
      Mix.Tasks.Terminator.Setup.run(["--silent"])
      assert_called(Mix.Tasks.Ecto.Migrate.run(["-r", "Terminator.Repo", "--silent"]))
    end
  end
end
