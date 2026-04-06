export tag Navbar
	css img w:6.5 h:6.5
		.px 
		filter: invert(1) sepia(1) saturate(500%) hue-rotate(200deg) brightness(50%) contrast(100%)
		o:66%
		image-rendering:pixelated
		@hover o:1
		cursor:pointer
	<self [h:14 mb:2 w:100% d:flex align-items:center justify-content:space-between]>
		<div [h:14 w:100% bg:warm9 bdb:2px solid warm8 d:flex pos:fixed]>
			<div [h:14 w:100% bg:warm8/33% d:flex align-items:center justify-content:space-between]>
				<div [px:4]>
					<img.px src="/assets/house_mojangles.png" route-to="/">
				<div>
					<input placeholder="FIXME: make this work">
					<img.px src="/assets/magnifying_mojangles.png" [w:5.25 h:5.25 pos:relative l:-6.5 b:-1.5]>
				<div [px:4]>
					<a [w:6.5] @click=(window.open("https://github.com/azazelcodes/qauth", "_blank").focus())>
						<ins [c:yellow3/66% @hover: yellow]> "QA"