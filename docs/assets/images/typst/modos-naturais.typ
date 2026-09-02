// Bibliotecas importadas
#import "@preview/cetz:0.4.2" // Desenho vetorial
#import "@preview/cetz-plot:0.1.3": plot, chart

#set page(width: auto, height: auto, margin: 5pt) 
#set text(lang: "pt", region: "BR", size: 12pt, font: "Arial")
// Use margin para dar um respiro, se desejar

// 🎨 Definição de Cores
#let uft-green = rgb("#008577")
#let uft-blue = rgb("#004A80")
#let uft-yellow = rgb("#FDB913")
#let uft-gray = rgb("#666666")
#let primary-color = uft-blue
#let secondary-color = uft-green

#cetz.canvas({
  import cetz.draw: *

    plot.plot(
      size: (5, 4), axis-style: none, name: "plot", 
      {
        for n in range(1, 4) {
          let y0 = 6 * (n - 1)
          plot.add(domain: (0, 2 * calc.pi), style: (stroke: (0.8pt+black)),
            t => (t, calc.sin(n * t/2) - y0)
          )
          plot.add(domain: (0, 2 * calc.pi), style: (stroke: (thickness: 0.6pt, paint: black, dash: "dashed")),
            t => (t, -calc.sin(n * t/2) - y0)
          )

          plot.add-anchor("pt-left-"+str(n), (-0.25, -y0))
          plot.add-anchor("pt-right-"+str(n), (2.1 * calc.pi, -y0))
          plot.add-anchor("pt-center-"+str(n), (3, -y0 + 2))
        }
      } 
    )

    let labels = ("(a)", "(b)", "(c)")
    for n in range(1, 4) {
      content("plot.pt-left-"+str(n), [$n =  #n$], anchor: "east")
      if n == 2 {
        content("plot.pt-right-"+str(n), [$L =  lambda$], anchor: "west")
      } else {
        content("plot.pt-right-"+str(n), [$L =  #n/2 lambda$], anchor: "west")
      }

      let nodes = n + 1
      let anti-nodes = n
      let legend = if n == 1 {
        text(size: 10pt)[#labels.at(n - 1) #nodes nós e #anti-nodes ventre]
      } else {
        text(size: 10pt)[#labels.at(n - 1) #nodes nós e #anti-nodes ventres]
      }
      content("plot.pt-center-"+str(n), [#legend])
    }

    line((0, 4), (0, -1), stroke: (thickness: 0.5pt, dash: "dashed"))
    line((5, 4), (5, -1), stroke: (thickness: 0.5pt, dash: "dashed"))
    line((0, -.5), (5, -.5), mark: (start: "stealth", end: "stealth"), stroke: 0.8pt, fill: black, name: "line-l")
    content("line-l.mid", [$L$], anchor: "north", padding: 0.1)
})