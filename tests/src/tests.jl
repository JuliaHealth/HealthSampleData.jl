#module tests
using Test
using SQLite
using HealthSampleData
using DataFrames

ENV["DATADEPS_ALWAYS_ACCEPT"] = true

@testset "OMOPCDM Data" begin

    @testset "Eunomia" begin
        eunomia = Eunomia()

        @test isempty(eunomia) == false
        db = SQLite.DB(eunomia)

        #SELECT COUNT(*) FROM sqlite_master WHERE type = 'table';
        tables = (SQLite.tables(db))
        num_tables = size(x)[1]
        @test num_tables == 37

        #Compare number of persons found in person table

        person_table = DBInterface.execute(db, "SELECT * FROM person") |> DataFrame
        number_of_persons = size(person_table)[1]

        @test number_of_persons == 2694
    end
end
