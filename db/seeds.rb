# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Region.create([
	{ 
		name: 'Kanto',
		generation: 'I',
		games: 'Blue/Red ',
		pokedex_count: 151,
	}, 
	{ 
		name: 'Johto',
		generation: 'II',
		games: 'Gold/Silver ',
		pokedex_count: 251,
	}, 
	{ 
		name: 'Hoenn',
		generation: 'III',
		games: 'Ruby/Sapphire',
		pokedex_count: 386,
	}, 
	{ 
		name: 'Sinnoh',
		generation: 'IV',
		games: 'Diamond/Pearl',
		pokedex_count: 493,
	}, 
	{ 
		name: 'Unova',
		generation: 'V',
		games: 'Black/White',
		pokedex_count: 649,
	}, 
	{ 
		name: 'Kalos',
		generation: 'VI',
		games: 'X/Y',
		pokedex_count: 721,
	}, 
	{ 
		name: 'Alola',
		generation: 'VII',
		games: 'Sun/Moon',
		pokedex_count: 809,
	}, 
	{ 
		name: 'Galar/Hisui',
		generation: 'VIII',
		games: 'Sword/Shield',
		pokedex_count: 905,
	}, 
	{ 
		name: 'Paldea',
		generation: 'VIII',
		games: 'Scarlet/Violet',
		pokedex_count: 1010,
	}, 
])

Type.create([
	{ name: 'Bug'}, 
	{ name: 'Dark'}, 
	{ name: 'Dragon'}, 
	{ name: 'Electr'}, 
	{ name: 'Fairy'}, 
	{ name: 'Fight'}, 
	{ name: 'Fire'}, 
	{ name: 'Flying'}, 
	{ name: 'Ghost'},
	{ name: 'Grass'},
	{ name: 'Ground'}, 
	{ name: 'Ice'}, 
	{ name: 'Normal'}, 
	{ name: 'Poison'}, 
	{ name: 'Psychic'}, 
	{ name: 'Rock'}, 
	{ name: 'Steel'}, 
	{ name: 'Water'}, 
])

