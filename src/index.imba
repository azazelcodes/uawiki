import { capitalize } from './util.imba'

tag NPCs
	npcs = ["therapist", "mechanic", "ragman"]
	css div d:flex flex-direction:column align-items:center
	css div.c
		mx:2
		d:grid
		grid-template-columns: repeat(2, 1fr) grid-template-rows: repeat(2, 1fr)
		grid-column-gap: 0 grid-row-gap: 0
		> @first grid-column: span 2
	css img h:16 py:1
	<self>
		<div>
			<h2> "NPCs"
			<div.c>
				for npc in npcs
					<div>
						<div [mx:8 my:2 aspect-ratio:1 bg:warm8/33% @hover:warm8/66% bd:2px solid warm8 cursor:pointer] route-to="/npc/{npc}">
							if (npcs.indexOf(npc) !== 0)
								<img src="/assets/baby/{npc}.png">
							<h3> capitalize(npc)
							if (npcs.indexOf(npc) === 0)
								<img src="/assets/baby/{npc}.png">

tag Banner
	css div d:flex flex-direction:column align-items:center mx:6 my:4
	css p text-align:justify text-align-last:justify
	css img h:32
	<self>
		<div>
			<img src="https://github.com/user-attachments/assets/a8105e08-3fa4-4570-897d-81980bcf0a31">
			<p>
				<span> "Welcome to your one-stop guide for "
				<ins [c:yellow]> "unauth.xyz"
				<span> ", actively updating since release!"
			<a> "Feel free to contribute!"

tag Items
	imgs = [
		"end_rod", "name_tag",
		"string", "verdant_froglight",
		"leather", "blaze_rod"
		]
	items = [
		"Silvia's Pocket Hawk Tuah Tower", "Dogtag",
		"String", "Verdant Frogman232343242light",
		"Leather", "Golden Rod"
		]
	css div d:flex flex-direction:column align-items:center text-align:center
	css div.c
		mx:2
		d:grid
		grid-template-columns: repeat(2, auto) grid-template-rows: repeat(3, auto)
		grid-column-gap: 0 grid-row-gap: 0
	css img h:10
	<self>
		<div>
			<h2> "Items"
			<p> "For a specific item use the search bar at the top!"
			<div.c> for item in items
				img = imgs.at(items.indexOf(item))
				<div>
					<div [mx:1 my:1 bg:warm8/33% @hover:warm8/66% bd:2px solid warm8 cursor:pointer p:1] route-to="/item/{img}">
						<img src="https://mc.nerothe.com/img/1.21.11/minecraft_{img}.png">
						<ins> item


tag Guides
	css div d:flex flex-direction:column align-items:center mx:6
	css p text-align:justify text-align-last:justify
	<self>
		<div>
			<h2> "Guides"
			<p [mb:0]> "To help you get started, the awesome contributors of this wiki have compiled some basic information and tips!"
			<p>
				<span> "In addition to these you can use "
				<ins> "/tutorial <crafting|quests|TODO:>"
			<div [flex-direction:row mb:4 w:100% h:12]>
				<button route-to="/guide/getting-started"> "Getting Started"
				<button route-to="/guide/questing"> "Questing"
				<button route-to="/guide/locations"> "Locations"


tag QAuthPromo
	css div d:flex flex-direction:column align-items:center mx:6
	css p text-align:justify text-align-last:justify
	css img h:32
	<self @click=(window.open("https://github.com/azazelcodes/qauth", "_blank").focus()) [cursor:pointer bg:warm8/33% @hover: warm8/66%]>
		<div>
			<h2> "Get Help Ingame!"
			<img src="https://github.com/user-attachments/assets/03b6aed8-e522-4a1c-a513-35c5219bbfa8">
			<p [mb:0]>
				<mark> <ins> "qauth"
				<span> " has lots of QOL specially made for "
				<ins [c:yellow]> "unauth.xyz"
				<span> "."
			<p>
				<span> "I'd appreciate it if you gave it a try!"



export tag Index
	css div > div
		d:flex justify-content:space-between align-items:center gap:2
		> bd: 2px solid warm8 w:fit-content h:fit-content
	<self>
		<div [d:flex flex-direction:column gap:16 mx:32 @!1300: 4]>
			<div>
				<NPCs>
				<Banner>
				<Items>
			<div>
				<Guides>
				<QAuthPromo>