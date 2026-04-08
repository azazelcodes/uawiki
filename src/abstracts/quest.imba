import { MD } from './markdown.imba'
import { capitalize } from '../util.imba'

tag quest_kill
	data
	t = "🗡"
	css .t fs:4 mt:1.5
	<self [d:flex gap:4 align-items:center]>
		<span.t @pointerover=(t="Kill"; this.classList.add("t")) @pointerleave=(t="🗡"; this.classList.remove("t")) [ff:"mc7"]> t
		<div [d:flex flex-direction:column align-items:center ml:auto]> for own e,a of data
			<div>
				<span [ff:"mc7" fs:2]> a
				<span [ff:"mc7" fs:2]> "x "
				<span> capitalize(e)

tag quest_mark
	data
	t = "⚓"
	css .t fs:4 mt:1.5
	<self [d:flex gap:4 align-items:center]>
		<span.t @pointerover=(t="Mark"; this.classList.add("t")) @pointerleave=(t="⚓"; this.classList.remove("t")) [ff:"mc7"]> t
		<div [ml:auto d:flex flex-direction:column gap:2 align-items:center]> for loc in data
			<a route-to=`/area/{loc}`> capitalize(loc)
		### old coordinate locations
		<span [ml:auto d:grid grid-template-columns:repeat(2, 1fr) gap:4 2]> for xyz in coordinates
			<div [d:flex flex-direction:column align-items:center flex:0 0 50%]>
				<span> loc[1]
				<div [d:flex text-align: center]>
					<span> loc[0]
					<div [w:4 d:flex]> # normally axes.svg here, dont know how to style yet
					<span> loc[2]
		### 



tag quest_rep
	data
	<self>
		<div> 
			<span> data
			<span> " Reputation"

tag quest_items
	data
	<self> for own i,a of data
		itemData = await (await window.fetch(`https://raw.githubusercontent.com/azazelcodes/uaapi/refs/heads/master/items/{i}.json`)).json()
		n = capitalize(i)
		if itemData
			n = itemData.name
		<a route-to=`/item/{i}`> a+" "+n

tag quest_cur
	data
	<self>
		<div>
			<span [ff:"mc7" fs:2]> "$"
			<span> data



export tag Quest
	data = {}
	def routed
		id = route.params.id
		issuer = route.params.by
		if (route.params.id === undefined)
			id = route.path.split('/')[-1]
		if (route.params.by === undefined)
			issuer = route.path.split('/')[-2]
		data = await (await window.fetch(`https://raw.githubusercontent.com/azazelcodes/uaapi/refs/heads/master/quests/{issuer}/{id}.json`)).json()

		text = await (await window.fetch(`/src/quests/{data.name}.md`)).text()

	css quest_sidebar@!850 display: none
	css quest_pulldown
		display: none
		@!960 display: flex

	css table bd:2px solid warm8/33%
		border-spacing:0
	css td padding:2
	css tr
		@odd bg:warm8/33%

	css p
		ff:"mc7" fs:2
		text-align:justify text-align-last:justify
		c:var(--mc-gray)

	<self>
		<quest_pulldown> # FIXME: add pulldown for mobile

		<MD text=text>
			<h1> data.name
			<p> data.desc
			<table [w:90%]>
				<tr route-to="/npc/{issuer}" [cursor:pointer]>
					<th> "by"
					<td>
						<div [d:flex align-items:center gap:2]>
							<img src="/assets/baby/{issuer}.png" [h:8]>
							<span> capitalize(issuer)
				<tr>
					<th> "Conditions: "
					<td [d:flex flex-direction:column gap:4]> for own k,v of data.cond
						<{"quest_"+k} data=v>
				<tr>
					<th> "Rewards: "
					<td [d:flex flex-direction:column gap:2]> for own k,v of data.rew
						<{"quest_"+k} data=v>
