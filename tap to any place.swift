        let tap = UITapGestureRecognizer(target: self, action: #selector(dismisspopdelete(_:)))
        view.addGestureRecognizer(tap)
    }
    @objc func dismisspopdelete(_:UITapGestureRecognizer){
        popupDeleteBtn.isHidden = true
    }
