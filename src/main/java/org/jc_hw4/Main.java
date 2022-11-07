package org.jc_hw4;

import org.flywaydb.core.Flyway;
import org.jetbrains.annotations.NotNull;

public class Main {
    public static void main(@NotNull String[] args) {
        var dbName = args[0];
        var user = args[1];
        var password = args[2];

        final Flyway flyway = Flyway
                .configure()
                .dataSource("jdbc:postgresql://localhost/" + dbName, user, password)
                .locations("db")
                .load();
        flyway.migrate();
        System.out.println("Migrations applied successfully");
    }
}