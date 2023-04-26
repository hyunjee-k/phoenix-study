defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :title, :string

      timestamps()
    end
  end
end

# 마이그레이션 파일이 순서대로 진행될 수 있도록 타임스탬프로 파일 명이 자동으로 정해진다.
