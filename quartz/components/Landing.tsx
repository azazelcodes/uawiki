import { QuartzComponentConstructor, QuartzComponentProps } from "./types"
import landingStyle from "./styles/landing.scss"
import Darkmode from "./Darkmode"
import Panel from "./Panel"

export default (() => {
  const DM = Darkmode()
  const P = Panel({
    title: "title",
    content: [
      [
        ["Contributing", "A||X[!https://sass-lang.com/documentation/style-rules/parent-selector/]\nZ||a"]
      ],
      [
        ["B", "B"],
        ["C", "C"]
      ]
    ]
  });
 
  function LandingComponent(props: QuartzComponentProps) {
    return (
      <div>
        <div class="stripes">
          <DM {...props} />
        </div>

        <div class="spacer"></div>

        <div class="grid">
          <div class="item item-0">
            <h2 class="title">Welcome to the Unauthorized Wiki!</h2>
            <div class="title">
              <p><a>Unauthorized</a> is a PvPvE extraction-type Minecraft server bla bla garabamble.</p>
              <p>Read more about the server at <a href="about">About Unauthorized</a>.</p>
            </div>
          </div>
          <div class="item item-1">1</div>
          <div class="item item-2">2</div>
        </div>


        <div class="panel-row"><P {...props} /></div>
        
      </div>
    )
  }
 
  LandingComponent.css = landingStyle;

  return LandingComponent
}) satisfies QuartzComponentConstructor