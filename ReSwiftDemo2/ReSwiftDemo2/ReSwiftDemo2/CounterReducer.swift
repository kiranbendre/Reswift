//
//  CounterReducer.swift
//  ReSwiftDemo2
//
//  Created by Iphone XR on 13/12/22.
//

import ReSwift
//MARK:- Step3- create respond to those diff.actions
// the reducer is responsible for evolving the application state based
// on the actions it receives
func counterReducer(action: Action, state: AppState?) -> AppState {
    // if no state has been provided, create the default state
    var state = state ?? AppState()
    
    switch action {
    case _ as CounterActionIncrease:
        state.counter += 1
    case _ as CounterActionDecrease:
        state.counter -= 1
    default:
        break
    }
    
    return state
}
