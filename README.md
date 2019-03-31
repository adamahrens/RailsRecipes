# RailsRecipes
A Ruby on Rails Recipe App

`rails g integration_test pages`
`rails g migration CreateChefs name:string email:string`
`rails g model Recipe name:string description:text`
`rails g migration AddChefToRecipes chef:references`
`c = Chef.create(name: 'Leroy', email: 'leroy@chef.com')`
`r = Recipe.create(name: 'Cookies', description: 'Cookies with Peanut butter', chef: c)`
`r.chef.name`
`r3 = Recipe.new(name: 'Orange Chicken', description: 'Orange Chicke with White Rice')`
`r3.create_chef(name: 'Vinny', email: 'vinny@chef.com')`
`r3.save`
