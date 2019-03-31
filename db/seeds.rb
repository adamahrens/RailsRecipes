# frozen_string_literal: true
chef = Chef.create(name: 'Leroy', email: 'leroy@chef.com')
Recipe.create(name: 'Cookies Shake', description: 'Cookies & Cream Shake', chef: chef)
Recipe.create(name: 'Hamburger', description: 'Angus Beef with Lettuce & Tomato', chef: chef)
