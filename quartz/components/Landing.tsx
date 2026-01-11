import { QuartzComponentConstructor, QuartzComponentProps } from "./types"
import landingStyle from "./styles/landing.scss"
import Darkmode from "./Darkmode"
import Panel from "./Panel"

export default (() => {
  const DM = Darkmode()
  const P = Panel({favouriteNumber: 55});
 
  function LandingComponent(props: QuartzComponentProps) {
    return (
      <div>
        <DM {...props} />

        <>
        <P {...props}></P>
        </>
      </div>
    )
  }
 
  LandingComponent.css = landingStyle;

  return LandingComponent
}) satisfies QuartzComponentConstructor