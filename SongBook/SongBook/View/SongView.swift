//
//  SongView.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/10/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import UIKit

class SongView: UIView {

    private var titleLabel: UILabel!
    var titleTextField: UITextField!
    private var authorLabel: UILabel!
    var authorTextField: UITextField!
    private var lyricsLabel: UILabel!
    var lyricsTextView: UITextView!
    private var saveButton: UIButton!
    private var cancelButton: UIButton!
    
    var cancelSong: (() -> Void)?
    var saveSong: ((SongModel, String?) -> Void)?
    
    func setupSubviews() {
        backgroundColor = .white
        addTitleLabel()
        addTitleTextField()
        addAuthorLabel()
        addAuthorTextField()
        addLyricsLabel()
        addLyricsTextView()
        addSaveButton()
        addCancelButton()
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked(_:)), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonClicked(_:)), for: .touchUpInside)
    }
    
    func configure(with songModel: SongModel) {
        titleTextField.text = songModel.title
        authorTextField.text = songModel.author
        lyricsTextView.text = songModel.lyrics
        saveButton.setTitle("Save", for: .normal)
    }
    
    private func addTitleLabel() {
        guard titleLabel == nil else { return }
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Title:"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        addSubview(label)
        label.snp.makeConstraints { maker in
            maker.leading.equalTo(UIScreen.main.bounds.width * 0.064)
            maker.trailing.equalTo(UIScreen.main.bounds.width * (-0.064))
            maker.top.equalTo(UIScreen.main.bounds.height * 0.082)
        }
        
        titleLabel = label
    }
    
    private func addTitleTextField() {
        guard titleTextField == nil else { return }
        let textField = UITextField()
        let borderRadius: CGFloat = 2
        let borderWidth: CGFloat = 0.2
        textField.placeholder = "Enter a title of the song"
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .words
        textField.returnKeyType = .next
        textField.layer.borderWidth = borderWidth
        textField.layer.cornerRadius = borderRadius
        addSubview(textField)
        textField.snp.makeConstraints { maker in
            maker.leading.equalTo(UIScreen.main.bounds.width * 0.064)
            maker.trailing.equalTo(UIScreen.main.bounds.width * (-0.064))
            maker.top.equalTo(titleLabel.snp.bottom).offset(UIScreen.main.bounds.height * 0.012)
        }
        
        titleTextField = textField
    }
    
    private func addAuthorLabel() {
        guard authorLabel == nil else { return }
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Author:"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        addSubview(label)
        label.snp.makeConstraints { maker in
            maker.leading.equalTo(UIScreen.main.bounds.width * 0.064)
            maker.trailing.equalTo(UIScreen.main.bounds.width * (-0.064))
            maker.top.equalTo(UIScreen.main.bounds.height * 0.165)
        }
        
        authorLabel = label
    }
    
    private func addAuthorTextField() {
        guard authorTextField == nil else { return }
        let textField = UITextField()
        let borderRadius: CGFloat = 2
        let borderWidth: CGFloat = 0.2
        textField.placeholder = "Enter an author of the song"
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .words
        textField.returnKeyType = .next
        textField.layer.borderWidth = borderWidth
        textField.layer.cornerRadius = borderRadius
        addSubview(textField)
        textField.snp.makeConstraints { maker in
            maker.leading.equalTo(UIScreen.main.bounds.width * 0.064)
            maker.trailing.equalTo(UIScreen.main.bounds.width * (-0.064))
            maker.top.equalTo(authorLabel.snp.bottom).offset(UIScreen.main.bounds.height * 0.012)
        }
        
        authorTextField = textField
    }
    
    private func addLyricsLabel() {
        guard lyricsLabel == nil else { return }
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Lyrics:"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        addSubview(label)
        label.snp.makeConstraints { maker in
            maker.leading.equalTo(UIScreen.main.bounds.width * 0.064)
            maker.trailing.equalTo(UIScreen.main.bounds.width * (-0.064))
            maker.top.equalTo(UIScreen.main.bounds.height * 0.247)
        }
        
        lyricsLabel = label
    }
    
    private func addLyricsTextView() {
        guard lyricsTextView == nil else { return }
        let textView = UITextView()
        let borderRadius: CGFloat = 2
        let borderWidth: CGFloat = 0.2
        textView.backgroundColor = .clear
        textView.layer.borderWidth = borderWidth
        textView.layer.cornerRadius = borderRadius
        textView.textAlignment = .left
        textView.autocorrectionType = .no
        textView.returnKeyType = .go
        textView.textColor = .black
        addSubview(textView)
        textView.snp.makeConstraints { maker in
            maker.leading.equalTo(UIScreen.main.bounds.width * 0.064)
            maker.trailing.equalTo(UIScreen.main.bounds.width * (-0.064))
            maker.top.equalTo(lyricsLabel.snp.bottom).offset(UIScreen.main.bounds.height * 0.012)
            maker.bottom.equalTo(UIScreen.main.bounds.height * (-0.165))
        }
        
        lyricsTextView = textView
    }
    
    private func addSaveButton() {
        guard saveButton == nil else { return }
        let button = UIButton(type: .system)
        let radius: CGFloat = 4.0
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 30.0 / 255.0, green: 144.0 / 255.0, blue: 255, alpha: 1.0)
        button.layer.cornerRadius = radius
        addSubview(button)
        button.snp.makeConstraints { maker in
            maker.trailing.equalTo(UIScreen.main.bounds.width * (-0.064))
            maker.bottom.equalTo(UIScreen.main.bounds.height * (-0.052))
            maker.height.equalTo(UIScreen.main.bounds.height * 0.06)
            maker.width.equalTo(UIScreen.main.bounds.height * 0.228)
        }
        
        saveButton = button
    }
    
    private func addCancelButton() {
        guard cancelButton == nil else { return }
        let button = UIButton(type: .system)
        let radius: CGFloat = 4.0
        let border: CGFloat = 1.0
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor(red: 30.0 / 255.0, green: 144.0 / 255.0, blue: 255, alpha: 1.0), for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = radius
        button.layer.borderWidth = border
        button.layer.borderColor = UIColor(red: 30.0 / 255.0, green: 144.0 / 255.0, blue: 255, alpha: 1.0).cgColor
        addSubview(button)
        button.snp.makeConstraints { maker in
            maker.leading.equalTo(UIScreen.main.bounds.width * 0.064)
            maker.bottom.equalTo(UIScreen.main.bounds.height * (-0.052))
            maker.height.equalTo(UIScreen.main.bounds.height * 0.06)
            maker.width.equalTo(UIScreen.main.bounds.height * 0.228)
        }
        
        cancelButton = button
    }
    
    @objc private func cancelButtonClicked(_ sender: UIButton) {
        cancelSong?()
    }
    
    @objc private func saveButtonClicked(_ sender: UIButton) {
        let song = SongModel(id: 0, title: titleTextField.text ?? "", author: authorTextField.text ?? "", lyrics: lyricsTextView.text)
        saveSong?(song, sender.titleLabel?.text)
    }
}
