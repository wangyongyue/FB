
import React from 'react';

class  Main extends React.Component{

    constructor() {
        super();
        this.state={
            items : []
        }
        var arr = [new CatData("123"),new CatData("sdff"),new CatData("sdfdsf"),new CatData("cat1")]


        var that = this
        var list = []
        for (var i = 0;i < arr.length;i ++){
            arr[i].index = i;
            const item = arr[i].render((index)=>{
                console.log(index)
                list.pop()
                that.setState({items:list})
            })
            list.push(item)
        }


        setTimeout(function(){
            that.setState({items:list})
        }, 1000);

    }

      render() {
        return (
            <div>
                {this.state.items}
            </div>
        );
      }

}
export default Main;


function CatData(name) {
    this.name = name;
    this.age = "";
    this.index = 0;
    this.render = function (callBack) {

        return (<Cat key={this.index.toString()}  model={this} onclick={(e)=>callBack(this.index)}/>);
    }
}

class  Cat extends React.Component{

    constructor() {
        super();
        this.state={
            value:""
        }
        
        this.onchange = this.onchange.bind(this)

    }

    onchange(e){
        this.setState({value:e.target.value})
        console.log(e.target.value)
        this.props.model.age = e.target.value
    }

      render() {
        return (
            <div>
                <p>{this.name}</p>
                 <p>{this.props.model.name}</p>
                <button type='button' onClick={this.props.onclick}>button</button>
                <input type="text" onChange={this.onchange} />
                <p>{this.state.value}</p>
            </div>

        );
      }

}