package com.snakegame;

import javax.swing.JFrame;

public class GameFrame extends JFrame {

    public GameFrame() {
        GamePanel panel = new GamePanel();
        add(panel);
        setTitle("Snake Game");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setResizable(false);
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }
}
