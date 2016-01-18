# Matrix

Allow you to create your own website to share your slides to all users.

Based on [reveal.js](https://github.com/hakimel/reveal.js) (The HTML Presentation Framework).

![portal](https://dn-h5jun.qbox.me/matrix-portal.png)

![admin](https://dn-h5jun.qbox.me/matrix-admin.png)

![admin2](https://dn-h5jun.qbox.me/matrix-admin2.png)

## Quick start

[DEMO](http://matrix.h5jun.com/slide/show?id=109 )

### installation

```
git clone https://github.com/akira-cn/matrix.git
cd matrix
npm install
```

### start server

```
npm start
```

### visit website

`http://127.0.0.1:9360`

### administrator panel

`http://127.0.0.1:9360/admin`

- login user: `admin`
- default password: `123456`

## demo

```markdown
## Diagram

- [Grammar](https://bramp.github.io/js-sequence-diagrams/) 
 
<!--.elements style="display:block;"-->

<div class="diagram" style="font-size:28px">
Alice->Bob: Hello Bob, how are you?
Note right of Bob: Bob thinks
Bob-->Alice: I am good thanks!
</div>

---
@echart,html

<h2>Chart <a href="http://echarts.baidu.com/">echarts</a></h2>

<script type="text/template">
option = {
    title : {
        text: 'Temperature',
        subtext: 'in a week'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['Max','Min']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : ['MON','TUE','WED','THU','FRI','STA','SUN']
        }
    ],
    yAxis : [
        {
            type : 'value',
            axisLabel : {
                formatter: '{value} °C'
            }
        }
    ],
    series : [
        {
            name:'Max',
            type:'line',
            data:[11, 11, 15, 13, 12, 13, 10],
            markPoint : {
                data : [
                    {type : 'max', name: 'Max'},
                    {type : 'min', name: 'Min'}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name: 'Aver'}
                ]
            }
        },
        {
            name:'Min',
            type:'line',
            data:[1, -2, 2, 5, 3, 2, 0],
            markPoint : {
                data : [
                    {name : 'Week Min', value : -2, xAxis: 1, yAxis: -1.5}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name : 'Average'}
                ]
            }
        }
    ]
};           
</script>
---
@stage:white

## Change Background <!--.elements style="color:black"-->
---
## Login to Admin

- http://matrix.qiwoo.org/admin
---
## More Features
```

## Thanks

[ThinkJS](http://www.thinkjs.org)

[Reveal.js](https://github.com/hakimel/reveal.js)
[CodeMirror](http://codemirror.net/)
[Mathjax](https://www.mathjax.org/)
[PrismJS](https://github.com/PrismJS/prism)

[Method-Draw](https://github.com/akira-cn/Method-Draw)
[js-sequence-diagrams](https://github.com/bramp/js-sequence-diagrams)
[ECharts](http://echarts.baidu.com/)

[Theme Designer](http://themedesigner.in/)
