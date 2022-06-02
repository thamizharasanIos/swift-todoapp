        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh mm a"
        let stringDate = dateFormatter.string(from: Date())
        print(stringDate)
