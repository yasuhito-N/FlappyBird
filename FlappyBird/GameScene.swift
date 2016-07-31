//
//  GameScene.swift
//  FlappyBird
//
//  Created by yasuhito on 2016/07/31.
//  Copyright © 2016年 yasuhito.nagata. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var scrollNode:SKNode!
    
    //SKView上にシーンが表示された時に呼ばれるメソッド
    override func didMoveToView(view: SKView) {
        
        //背景色を設定
        backgroundColor = UIColor(colorLiteralRed: 0.15, green: 0.75, blue: 0.90, alpha: 1)
        
        //スクロールするスプライトの親ノード
        scrollNode = SKNode()
        addChild(scrollNode)
        
        //地面
        let groundTexture = SKTexture(imageNamed: "ground")
        groundTexture.filteringMode = SKTextureFilteringMode.Nearest
        
        // 必要な枚数を計算
        let needNumber = 2.0 + (frame.size.width / groundTexture.size().width)
        
        // スクロールするアクションを作成
        // 左方向に画像一枚分スクロールさせるアクション
        let moveGround = SKAction.moveByX(-groundTexture.size().width , y: 0, duration: 5.0)
        
        // 元の位置に戻すアクション
        let resetGround = SKAction.moveByX(groundTexture.size().width, y: 0, duration: 0.0)
        
        // 左にスクロール->元の位置->左にスクロールと無限に繰り替えるアクション
        let repeatScrollGround = SKAction.repeatActionForever(SKAction.sequence([moveGround, resetGround]))
        
        // groundのスプライトを配置する
        for var i:CGFloat = 0; i < needNumber; i += 1 {
            let sprite = SKSpriteNode(texture: groundTexture)
            
            // スプライトの表示する位置を指定する
            sprite.position = CGPoint(x: i * sprite.size.width, y: groundTexture.size().height / 2)
            
            // スプライトにアクションを設定する
            sprite.runAction(repeatScrollGround)
            
            // スプライトを追加する
            scrollNode.addChild(sprite)
        }
        
        //テクスチャを指定してスプライトを作成する
        let groundSprite = SKSpriteNode(texture: groundTexture)
        
        //スプライトの表示する位置を指定する
        groundSprite.position = CGPoint(x: size.width / 2, y: groundTexture.size().height / 2)
        
        //シーンにスプライトを追加する
        addChild(groundSprite)
        
    }

}
