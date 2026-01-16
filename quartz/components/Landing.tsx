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
        <DM {...props} />

        <P {...props} />
      </div>
    )
  }
 
  LandingComponent.css = landingStyle;

  return LandingComponent
}) satisfies QuartzComponentConstructor