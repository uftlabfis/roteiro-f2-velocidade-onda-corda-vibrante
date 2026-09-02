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
  arc((2.25, 1.2), start: 0deg, stop: 44.3deg, radius: 1, mode: "PIE", fill: primary-color.lighten(80%), stroke: 1pt+primary-color)
  content((1.9, 1.5), [$alpha$])
  content((1.3, 0.9), [#text(size: 9pt)[$tan alpha = f_(1"(obs)")$]], anchor: "west")
  plot.plot(size: (3, 3), axis-style: "school-book", x-tick-step: 1, y-tick-step: none, x-min: 0, y-min: 0, x-label: [$n$], y-label: [$f$], name: "plot",{
    plot.add(((0, 0), (5, 10)), style: (stroke: 1.5pt+primary-color))
    plot.add(((1,2.6), (2,4.3), (3,6), (4, 7.5), (5, 10.2)), style: (stroke: none), mark: "o", mark-size: 0.14, mark-style: (fill: primary-color.lighten(80%), stroke: primary-color))
  })
})