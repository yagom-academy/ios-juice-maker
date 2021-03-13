//
//  JSONString.swift
//  JuiceMaker
//
//  Created by 강경, Ryan on 2021/03/13.
//

import Foundation

// MARK: - Recipe Type이 디코딩할 jsonString
let jsonString = """
    {
        "juiceRecipes":
        [
            {
                "name": "딸기쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Strawberry",
                        "quantity": 16
                    }
                ]
            },
            {
                "name": "바나나쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Banana",
                        "quantity": 2
                    }
                ]
            },
            {
                "name": "키위쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Kiwi",
                        "quantity": 3
                    }
                ]
            },
            {
                "name": "파인애플쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Pineapple",
                        "quantity": 2
                    }
                ]
            },
            {
                "name": "딸바쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Strawberry",
                        "quantity": 10
                    },
                    {
                        "fruitName": "Banana",
                        "quantity": 1
                    }
                ]
            },
            {
                "name": "망고쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Mango",
                        "quantity": 3
                    }
                ]
            },
            {
                "name": "망고키위쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Mango",
                        "quantity": 2
                    },
                    {
                        "fruitName": "Kiwi",
                        "quantity": 1
                    }
                ]
            }
        ]
    }
"""
