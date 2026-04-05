import { Quest } from './abstracts/quest.imba'
import { Item } from './abstracts/item.imba'
import { NPC } from './abstracts/npc.imba'
import { Index } from './index.imba'
import { Navbar } from './navbar.imba'

import './global.css'
import './global.css.imba'

global css body c:white bg:warm9 ff:Arial inset:0 d:vcc

tag App
	count = 0
	<self [w:100% h:100%]>
		<Navbar>

		<Index route="/">

		<Quest route="/quest/:by/:id">
		<Item route="/item/:id">
		<NPC route="/npc/:name">

imba.mount <App>
