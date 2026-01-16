import { QuartzComponentProps, QuartzComponentConstructor } from "./types"
import panelStyle from './styles/panel.scss'

/*
 * Construct via
 * Panel({
     title: "Title",
     content: [ rows
       [ columns
         ["Subtitle", "Description text||New column\nNew Line with a link[!https://example.org]"],
       ],
     ]
   });
 * 
 * || splits into new column
 * \n splits into new line
 * [!LINK] makes whole line a link
 * 
 */

interface Options {
  title: string
  content: [string, string][][]
}
 
const defaultOptions: Options = {
  title: "",
  content: [[]]
}
 
export default ((userOpts?: Options) => {
  const opts = { ...defaultOptions, ...userOpts }
  function Panel(_props: QuartzComponentProps) {
    if (opts.title.length < 1) {
      return null
    }
    if (opts.content.length < 1 || opts.content[0].length < 1) {
      return null
    }
 
    return <>
    <div class="panel" id={opts.title}><div class="pannette"><div class="panneaux">
      <h2 class="title">{opts.title}</h2>
      {
        opts.content.map((col, ri) => {
          return <div class="container">{
            col.map((itm, ci) => {
              const [title, d] = itm;
              const description = d.split("||");
              return <div class="item" key={`${ri}-${ci}`}><div>
                <div class="banner"><a class="panel-link__txt" href={title.toLowerCase()}>{title}</a><a class="panel-link__img" href={title.toLowerCase()}><img src={`static/${title.toLowerCase()}.png`}></img></a></div>
                <div class="content">
                  {description.map((group, dgi) => {
                    const lines = group.split("\n");
                    return <div key={dgi}>{
                      lines.map((line, dli) => {
                        const linkable = line.match(/\[!(.+?)\]/);
                        const Line = linkable ? 'a' : 'p';
                        return <Line key={dli} style="margin: 0 !important;" href={ linkable ? linkable[1] : undefined }>{line.replace(/\[!.+?\]/g, "").split(" ").join("")}</Line> // "nofollow" here probably
                      })
                      }</div>
                  })}
                </div>
              </div></div>
            })
          }</div>
        })
      }
    </div></div></div>
    </>
  }
 

  Panel.css = panelStyle;

  return Panel
}) satisfies QuartzComponentConstructor