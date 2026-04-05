import markdownit from 'markdown-it'
import { alertPlugin } from 'markdown-it-github-alert'
import anchorPlugin from 'markdown-it-github-headings'
import markPlugin from 'markdown-it-mark'
import fnPlugin from 'markdown-it-footnote'
import insPlugin from 'markdown-it-ins'

import '../md.css'

const md = markdownit().use(alertPlugin).use(markPlugin).use(fnPlugin).use(insPlugin)# .use(anchorPlugin) # not working because of dynamic parsing

export tag MD
	text

	css #md	
		flex:1 p:4 2
		border-x:solid 2px warm8
		bg: warm8/33%
	
	sidebar = 100
	<self>
		<div [w:100% d:flex justify-content:center]>
			<div [w:8]>
			<div#md>
				if !text.startsWith("<")
					this.querySelector('#md').innerHTML = md.render(text)
				else
					this.querySelector('#md').remove()
		
			<div [w:{sidebar} p:4 d:flex flex-direction:column align-items:center]>
				<md_sidebar [pos:fixed d:flex flex-direction:column align-items:center p:4]>
					<slot> <p> sidebar = 0