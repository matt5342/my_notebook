import React, { Component } from 'react';
import './App.css';
// import TextEditor from './slate/TextEditor'
import Login from './components/Login'
import Navigation from './components/Navigation';
import Home from './components/Home';
import SignUp from './components/SignUp';

class App extends Component {

  state = {
    view: "default", 
    user: {}
  }

  setUser = (userObj) => {
    this.setState({
      user: userObj
    })
  }
  handleLogout = () => {
    this.setUser({})
    localStorage.removeItem("token")
  }
  
  componentDidMount(){
    if(localStorage.getItem("token")) {
      fetch('http://localhost:3000/api/v1/login', {
        headers: {"Authorization": localStorage.token}
      })
      .then(r => r.json())
      .then(user => {
        // debugger
        this.setUser(user)
        })
    }
  }
  changeView = (newView) => {
    if (newView === 'logout'){
      this.handleLogout()
      this.setState({ view: "login"})
    }
    else{
      this.setState({ view: newView})
    }
  }
  renderView = () => {    
    switch (this.state.view) {
      case 'home':
        return <Home changeView={this.changeView} />
      case 'login':
        return <Login setUser={this.setUser} changeView={this.changeView} />
      case 'signup':
        return <SignUp setUser={this.setUser} changeView={this.changeView} />
      default: 
        return <Home changeView={this.changeView} />

    }
  }

  render(){
    return (
  
      <div className="App">
        <Navigation user={this.state.user} handleLogout={this.handleLogout} changeView={this.changeView} />
        {this.renderView()}
        {/* <Login changeView={this.changeView} /> */}
        {/* <TextEditor /> */}
      </div>
    );
  }
}

export default App;
