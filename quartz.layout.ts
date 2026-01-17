import { PageLayout, SharedLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"

// components shared across all pages
export const sharedPageComponents: SharedLayout = {
  head: Component.Head(),
  header: [],
  afterBody: [],
  footer: Component.Footer({
    links: {
      GitHub: "https://github.com/azazelcodes/uawiki",
      "Discord Community": "https://discord.gg/2S6AN759ES",
    },
  }),
}

// components for pages that display a single page (e.g. a single note)
export const defaultContentPageLayout: PageLayout = {
  beforeBody: [
    Component.ConditionalRender({
      component: Component.Breadcrumbs(),
      condition: (page) => page.fileData.slug !== "index",
    }),
    Component.ArticleTitle(),
    Component.ContentMeta(),
    Component.TagList(),
  ],
  left: [
    Component.PageTitle(),
    Component.MobileOnly(Component.Spacer()),
    Component.Flex({
      components: [
        {
          Component: Component.Search(),
          grow: true,
        },
        { Component: Component.Darkmode() },
      ],
    }),
    Component.TableOfContents(),
    Component.Explorer({
      filterFn: (node) => {if(node.slug.includes("doc-template")) return false; return true},
      sortFn: (a, b) => {
        if ((!a.isFolder && !b.isFolder) || (a.isFolder && b.isFolder)) {
          return a.displayName.localeCompare(b.displayName, undefined, {
            numeric: true,
            sensitivity: "base",
          })
        }

        if (b.data!.title === "About Unauthorized") return 1
    
        if (!a.isFolder && b.isFolder) {
          return 1
        } else {
          return -1
        }
      }
    }),
  ],
  right: [ // just register components rendered in other components here, i.e. panel, just used on landing
    Component.ConditionalRender({
      component: Component.Flex({
        components: [
          {
            Component: Component.Panel()
          }, // ADD COMPONENTS HERE
          {
            Component: Component.Landing()
          },
        ]
      }),
      condition: (_) => false,
    }),
  ],
}

// components for pages that display lists of pages  (e.g. tags or folders)
export const defaultListPageLayout: PageLayout = {
  beforeBody: [Component.Breadcrumbs(), Component.ArticleTitle(), Component.ContentMeta()],
  left: [
    Component.PageTitle(),
    Component.MobileOnly(Component.Spacer()),
    Component.Flex({
      components: [
        {
          Component: Component.Search(),
          grow: true,
        },
        { Component: Component.Darkmode() },
      ],
    })
  ],
  right: [],
}
