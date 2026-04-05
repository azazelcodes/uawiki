import { MD } from './markdown.imba'
import { capitalize } from '../util.imba'

export tag NPC
	def routed
		name = route.params.name
		quests = await (await window.fetch(`https://raw.githubusercontent.com/azazelcodes/uaapi/refs/heads/master/quests/{name}.index.json`)).json()
		text = await (await window.fetch(`/src/npcs/{name}.md`)).text()
	
	<self>
		<MD text=text>
			<img src="/assets/baby/{name}.png" [h:64]>
			<h1> capitalize(name)