# RecipeBot API

## Limitations
- Max items per request is `50`
- Provides cursor pagination I.e. `after_cursor`, `before_cursor` and `total_count`

### Endpoints

> /parse

Parses a recipe website

**parameters**

`url:string`

---

> /search

Perform search queries

**parameters**

`title:string`
`ingredients:string(comma seperated)`

---

### Database

**Recipes**
`id:uuid`
`title:string`
`url:string`
`url_hash:string`
`prep:string`
`cook:string`
`total:string`
`serving:string`
`directions:string`

**Ingredients**
`id:uuid`
`name:string`

**MeasurementUnits**
`id:uuid`
`name:string`

**MeasurementAmount**
`id:uuid`
`amount:float`

**RecipeIngredients**
`id:uuid`
`recipe_id:uuid`
`ingredient_id:uuid`
`measurement_amount_id:uuid`
`measurement_unit_id:uuid`

**NutritionValues**
`id:uuid`
`name:string`

**RecipeNutritionValues**
`id:uuid`
`recipe_id:uuid`
`nutrition_id:uuid`
`measurement_amount_id:uuid`
`measurement_unit_id:uuid`

