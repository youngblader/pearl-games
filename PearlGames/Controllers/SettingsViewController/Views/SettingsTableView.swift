//
//  SettingsTableView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 17.10.23.
//

import UIKit

enum SettingOptionType {
    case theme, appearance
}

struct SettingsOption {
    let title: String
    let icon: String
    let iconBackgroundColor: UIColor
    let optionType: SettingOptionType
}

final class SettingsTableView: UITableView {
    private let settingsOptions: [SettingsOption] = [SettingsOption(title: "Theme", icon: "diamond.circle.fill", iconBackgroundColor: .systemPurple, optionType: .theme), SettingsOption(title: "Appearance", icon: "circle.lefthalf.filled", iconBackgroundColor: .systemTeal, optionType: .appearance)]
    
    var onButtonTapped: ((SettingOptionType)->())?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .insetGrouped)
        
        self.delegate = self
        self.dataSource = self
        
        self.register(SettingCell.self, forCellReuseIdentifier: SettingCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let settingsOptionType = settingsOptions[indexPath.row].optionType
        
        self.onButtonTapped?(settingsOptionType)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.reuseId, for: indexPath) as! SettingCell
        
        let item = settingsOptions[indexPath.row]
        
        cell.update(item)
        
        return cell
    }
}
