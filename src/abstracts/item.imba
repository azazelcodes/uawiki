import { MD } from './markdown.imba'
import { capitalize, hasKey } from '../util.imba'

tag Price
	c = []
	<self [d:inline-block]>
		<span> " for "
		i = 0
		for own [p,a] in Object.entries(price)
			if p == "cur"
				<ins> "$"
				<ins> a
			else
				<ItemName p=p a=a c=c>

			if Object.entries(price).length > i+1
				<ins> ", "

			i+=1
		<span> " worth "
		<ins> "$"
		<ins>
			sum = 0
			for i in c
				sum += i
			sum

tag ItemName
	def mount
		n = capitalize(p)
		resp = await window.fetch(`https://raw.githubusercontent.com/azazelcodes/uaapi/refs/heads/master/items/{p}.json`)
		if resp.ok
			data = await (resp).json()
			n = data.name
			c.push(data.sell)

	<self [d:inline-block]>
		<a route-to="/item/{p}">
			<ins> a
			<ins> " "
			<ins> n


export tag Item
	def routed
		id = route.params.id
		item = {}
		resp = await window.fetch(`https://raw.githubusercontent.com/azazelcodes/uaapi/refs/heads/master/items/{id}.json`)
		if resp.ok
			item = await resp.json()
		text = await (await window.fetch(`/src/items/{item.name}.md`)).text()
	
	css a,p p:0 m:0

	<self>
		<MD text=text>
			<img src="https://mc.nerothe.com/img/1.21.11/minecraft_{id}.png">
			if hasKey(item)
				<h1> item.name
				<p>
					<span> "NPCs buy "
					<ins> "1 " + item.name
					<span> " for "
					<ins> "$"+item.sell
				if hasKey(item.buy)
					<p> for own bdata in item.buy
						<p>
							<a route-to="/npc/{bdata.npc}"> <ins> capitalize(bdata.npc)
							<span> " sells "
							<ins> bdata.amount
							<ins> " "
							<ins> item.name
							if bdata.amount > 1
								<ins> "s"
							<span> " "
							<Price price=bdata.price>
							
							<p>
								<ins> bdata.rep
								<ins> " Reputation"
								<span> " is needed for this barter."
							if hasKey(bdata.enchantments)
								<p>
									<span> "The sold item has " 
									for own [e,l] in Object.entries(bdata.enchantments)
										<ins> capitalize(e)
										<ins> " "
										<ins> l
				if hasKey(item.craft)
					<p> for own cdata in item.craft
						<p>
							<span> "You can craft "
							<ins> cdata.amount
							<ins> " "
							<ins> item.name
							if cdata.amount > 1
								<ins> "s"
							<span> " at the "
							<a route-to="/station/{cdata.station}"> <ins> capitalize(cdata.station) + " Station"

							<span> " "
							<Price price=cdata.price>

							<p>
								<span> "The craft takes "
								<ins> 
									h = Math.floor(cdata.time / 3600)
									m = Math.floor((cdata.time % 3600) / 60)
									s = cdata.time % 60
									str = "";
									if h
										str += h + "h "
									if m
										str += m + "min "
									if s
										str += s + "s"
									if str.length > 0
										str
									else
										"0s"

							if hasKey(cdata.enchantments)
								<p>
									<span> "The resulting item has " 
									for own [e,l] in Object.entries(cdata.enchantments)
										<ins> capitalize(e)
										<ins> " "
										<ins> l

			else
				<div [d:flex flex-direction:column gap:2 align-items:center mt:8]>
					<p> "There is no entry for this item yet."
					<a href="https://minecraft.wiki/w/{id}"> "Here is {capitalize(id)}s "
						<ins> "minecraft.wiki"
						<span> " entry!"