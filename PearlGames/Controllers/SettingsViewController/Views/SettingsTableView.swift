//
//  SettingsTableView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 17.10.23.
//

import UIKit

struct SettingsOption {
    let title: String
    let icon: String
    let iconBackgroundColor: UIColor
}

final class SettingsTableView: UITableView {
    private let settingsOptions: [SettingsOption] = [SettingsOption(title: "General", icon: "house", iconBackgroundColor: .systemPink), SettingsOption(title: "Theme", icon: "house", iconBackgroundColor: .systemYellow), SettingsOption(title: "Appearance", icon: "house", iconBackgroundColor: .systemCyan)]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .insetGrouped)
        
        self.delegate = self
        self.dataSource = self
        
        self.register(SettingCell.self, forCellReuseIdentifier: SettingCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update() {
        
    }
}

extension SettingsTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsOptions.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.reuseId, for: indexPath) as! SettingCell
        
        let item = settingsOptions[indexPath.row]
        
        cell.update(item)
        
        return cell
    }
}
