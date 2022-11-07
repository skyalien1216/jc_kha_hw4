CREATE TABLE hw_jc.providers_ingredients
(
    id serial primary key NOT NULL,
    provider_id integer references hw_jc.providers(id) NOT NULL,
    ingredient_id integer references hw_jc.ingredients(id) NOT NULL,
    cost_kg numeric DEFAULT 0
);

alter table hw_jc.ingredients
   add constraint check_positive_i_available  check (hw_jc.ingredients.available >= 0);

alter table hw_jc.providers_ingredients
   add constraint check_positive_pi_cost_kg check (hw_jc.providers_ingredients.cost_kg >= 0);

alter table hw_jc.units_of_measurement
   add constraint check_positive_uom_kg check (hw_jc.units_of_measurement.kg >= 0);

alter table hw_jc.dishes
   add constraint check_positive_d_cost check (hw_jc.dishes.cost >= 0);

alter table hw_jc.dish_components
   add constraint check_positive_dc_amount check (hw_jc.dish_components.amount > 0);