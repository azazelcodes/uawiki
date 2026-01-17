export function parseQuest(tslug) {
    let slug = window.location.pathname;
    const base = "/quests/doc-template";
    const incomplete = (slug === base || "/"+tslug === base);
    const clean = incomplete ? "quests/"+window.location.href.split(tslug)[1].split("?")[1].replace(".html", "") : "";
    if (incomplete) { tslug = clean; slug = "/"+clean }
    if ("/"+tslug != slug) return false
    fetch(`https://raw.githubusercontent.com/azazelcodes/uaapi/refs/heads/master${slug}.json`).then(res => {if(!res.ok) window.location.pathname="404"; return res.json()}).then(constructSidebar)
    return true
}

function constructSidebar(data) {
    document.getElementById("qtitle").textContent=data["name"];
    document.getElementsByClassName("article-title")[0].innerHTML=data["name"];

    const giver = document.getElementById("qgiver");
    giver.textContent=data["by"]; giver.href=`../npcs/${data["by"]}`;
    
    const description = document.getElementById("qdesc");
    description.textContent=data["desc"];

    const conditions = document.getElementById("qcond");
    conditions.replaceChildren([]);
    Object.entries(data["cond"]).map((condition) => {
        const cond = () => {switch (condition[0]) {
            case "kill":
                return "Kill "+Object.entries(condition[1]).map(([key, value]) => `${value} ${capitalize(key)}${value !== 1 ? 's' : ''}`).join(' and ')
            case "mark":
                return "Visit and mark "+JSON.stringify(condition[1])
            default:
                break;
        }}
        const p = document.createElement("p");
        p.textContent = cond();
        conditions.appendChild(p);
    })

    const rewards = document.getElementById("qrew");
    rewards.replaceChildren([]);
    Object.entries(data["rew"]).map((reward) => {
        // add links?
        const a = document.createElement("a");
        const rew = () => {switch (reward[0]) {
            case "rep":
                a.href = "../npcs/reputation"
                a.textContent = "Reputation"
                return JSON.stringify(reward[1])+" "
            case "cur":
                a.href = "../currency"
                a.textContent = JSON.stringify(reward[1])+"$"
                return ""
            case "items":
                return reward[1].join(' and ')
            default:
                break;
        }}
        const p = document.createElement("p");
        p.textContent = rew();
        p.appendChild(a);
        rewards.appendChild(p);
    })
}

function capitalize(val) {
    return String(val).charAt(0).toUpperCase() + String(val).slice(1);
}



export function findIncomplete() {
    const list = document.getElementsByClassName("callout-content")[0];
    let incomplete = [];
    fetch(`https://api.github.com/repos/azazelcodes/uaapi/contents/quests`).then(res => res.json()).then((data) => {
        let implemented = [];
        Object.entries(document.getElementsByClassName("page-listing")[0].children[1].children[0].children).forEach((child) => {
            const name = child[1].children[0].getElementsByClassName("desc")[0].children[0].children[0].href.split("/quests/")[1];
            if (name.endsWith("/")) return;
            implemented.push(name+".json");
        });
        Object.entries(data).forEach((all) => !implemented.includes(all[1]["name"]) && incomplete.push(all[1]) );
        if (incomplete.length != 0) list.replaceChildren([]);

        incomplete.forEach((ic) => {
            const n = ic["name"].replace(".json","");
            const src = document.createElement("a");
            src.textContent = "Quest ID " + n;
            src.href = ic["html_url"];
            const a = document.createElement("a");
            src.href = `doc-template?${n}.html`;
            list.appendChild(src);
        })
    });
}