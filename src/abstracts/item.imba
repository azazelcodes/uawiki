import { MD } from './markdown.imba'
import { capitalize } from '../util.imba'

export tag Item
	def routed
		id = route.params.id
		item = {}
		items = await (await window.fetch(`https://raw.githubusercontent.com/azazelcodes/uaapi/refs/heads/master/items.json`)).json()
		if items[id]
			item = items[id]
		text = await (await window.fetch(`/src/items/{item.name}.md`)).text()
	
	css a,p p:0 m:0

	<self>
		<MD text=text>
			<img src="https://mc.nerothe.com/img/1.21.11/minecraft_{id}.png">
			if Object.keys(item).length > 0
				<h1> item.name
			else
				<div [d:flex flex-direction:column gap:2 align-items:center mt:8]>
					<p> "There is no entry for this item yet."
					<a href="https://minecraft.wiki/w/{id}"> "Here is {capitalize(id)}s "
						<ins> "minecraft.wiki"
						<span> " entry!"