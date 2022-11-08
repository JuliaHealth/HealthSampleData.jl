@testset "OMOPCDM Data" begin

    @testset "Eunomia" begin
        eunomia = Eunomia()

        # NOTE: Ensures Eunomia is installed
        @test isempty(eunomia) == false
        db = SQLite.DB(eunomia)

        # NOTE: Query used to get 37: SELECT COUNT(*) FROM sqlite_master WHERE type = 'table';
        tables = (SQLite.tables(db))
        num_tables = size(tables)[1]
        @test num_tables == 37

        # NOTE: Compare number of persons found in person table
        person_table = DBInterface.execute(db, "SELECT * FROM person") |> DataFrame
        number_of_persons = size(person_table)[1]

        @test number_of_persons == 2694
    end
end
