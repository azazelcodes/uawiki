import { QuartzComponentProps, QuartzComponentConstructor } from "./types"
import panelStyle from './styles/panel.scss'

interface Options {
  favouriteNumber: number
}
 
const defaultOptions: Options = {
  favouriteNumber: 22,
}
 
export default ((userOpts?: Options) => {
  const opts = { ...defaultOptions, ...userOpts }
  function Panel(_props: QuartzComponentProps) {
    if (opts.favouriteNumber < 0) {
      return null
    }
 
    return <p class="red-text">{opts.favouriteNumber}</p>
  }
 

  Panel.css = panelStyle;

  return Panel
}) satisfies QuartzComponentConstructor