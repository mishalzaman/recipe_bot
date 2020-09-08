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

**RecipeIngredients**
`id:uuid`
`recipe_id:uuid`
`name:string`
`unit:string`
`amount:float`

**RecipeNutritions**
`id:uuid`
`recipe_id:uuid`
`name:string`
`unit:string`
`amount:float`

