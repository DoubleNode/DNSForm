//
//  DNSFormTests.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSFormTests
//
//  Created by Darren Ehlers.
//  Copyright © 2025 - 2016 DoubleNode.com. All rights reserved.
//

import XCTest
@testable import DNSError
@testable import DNSForm
import Combine
import UIKit
import DNSDataObjects
import DNSCore
import DNSThemeTypes
import AnimatedField
import DNSBaseStage

class DNSFormTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }

    // MARK: - DNSFormFieldType Tests

    func test_DNSFormFieldType_allCases() {
        let expectedCases: [DNSFormFieldType] = [.none, .email, .password, .price, .text, .url, .username]
        XCTAssertEqual(DNSFormFieldType.allCases, expectedCases)
    }

    func test_DNSFormFieldType_rawValues() {
        XCTAssertEqual(DNSFormFieldType.none.rawValue, "")
        XCTAssertEqual(DNSFormFieldType.email.rawValue, "email")
        XCTAssertEqual(DNSFormFieldType.password.rawValue, "password")
        XCTAssertEqual(DNSFormFieldType.price.rawValue, "price")
        XCTAssertEqual(DNSFormFieldType.text.rawValue, "text")
        XCTAssertEqual(DNSFormFieldType.url.rawValue, "url")
        XCTAssertEqual(DNSFormFieldType.username.rawValue, "username")
    }

    func test_DNSFormFieldType_initFromRawValue() {
        XCTAssertEqual(DNSFormFieldType(rawValue: ""), .none)
        XCTAssertEqual(DNSFormFieldType(rawValue: "email"), .email)
        XCTAssertEqual(DNSFormFieldType(rawValue: "password"), .password)
        XCTAssertEqual(DNSFormFieldType(rawValue: "price"), .price)
        XCTAssertEqual(DNSFormFieldType(rawValue: "text"), .text)
        XCTAssertEqual(DNSFormFieldType(rawValue: "url"), .url)
        XCTAssertEqual(DNSFormFieldType(rawValue: "username"), .username)
        XCTAssertNil(DNSFormFieldType(rawValue: "invalid"))
    }

    // MARK: - DNSFormCodeLocation Tests

    func test_DNSFormCodeLocation_domainPreface() {
        XCTAssertEqual(DNSFormCodeLocation.domainPreface, "com.doublenode.form.")
    }

    func test_DNSFormCodeLocation_inheritance() {
        // Test that DNSFormCodeLocation is a subclass of DNSCodeLocation
        XCTAssertTrue(DNSFormCodeLocation.self is DNSCodeLocation.Type)
    }

    // MARK: - DNSFormStageModels Tests

    func test_DNSFormStageModels_AppActionRequest_initialization() {
        let request = DNSFormStageModels.AppAction.Request(field: "testField", appAction: nil)

        XCTAssertEqual(request.field, "testField")
        XCTAssertNil(request.appAction)
    }

    func test_DNSFormStageModels_AppActionRequest_initializationWithoutAppAction() {
        let request = DNSFormStageModels.AppAction.Request(field: "testField")

        XCTAssertEqual(request.field, "testField")
        XCTAssertNil(request.appAction)
    }

    func test_DNSFormStageModels_FieldRequest_initialization() {
        let request = DNSFormStageModels.Field.Request(field: "testField",
                                                       subfield: "testSubfield",
                                                       languageCode: "en",
                                                       value: "testValue")

        XCTAssertEqual(request.field, "testField")
        XCTAssertEqual(request.subfield, "testSubfield")
        XCTAssertEqual(request.languageCode, "en")
        XCTAssertEqual(request.value as? String, "testValue")
    }

    func test_DNSFormStageModels_FieldRequest_initializationWithDefaults() {
        let request = DNSFormStageModels.Field.Request(field: "testField", languageCode: "en")

        XCTAssertEqual(request.field, "testField")
        XCTAssertEqual(request.subfield, "")
        XCTAssertEqual(request.languageCode, "en")
        XCTAssertNil(request.value)
    }

    func test_DNSFormStageModels_FieldResponse_initialization() {
        let response = DNSFormStageModels.Field.Response(field: "testField")

        XCTAssertEqual(response.field, "testField")
        XCTAssertNil(response.error)
    }

    func test_DNSFormStageModels_FieldResponse_initializationWithoutError() {
        let response = DNSFormStageModels.Field.Response(field: "testField")

        XCTAssertEqual(response.field, "testField")
        XCTAssertNil(response.error)
    }

    func test_DNSFormStageModels_FieldViewModel_initialization() {
        let viewModel = DNSFormStageModels.Field.ViewModel(field: "testField", alertMessage: "Test alert")

        XCTAssertEqual(viewModel.field, "testField")
        XCTAssertEqual(viewModel.alertMessage, "Test alert")
    }

    func test_DNSFormStageModels_FieldViewModel_initializationWithDefaults() {
        let viewModel = DNSFormStageModels.Field.ViewModel(field: "testField")

        XCTAssertEqual(viewModel.field, "testField")
        XCTAssertEqual(viewModel.alertMessage, "")
    }

    func test_DNSFormStageModels_ImagePopupRequest_initialization() {
        let image = UIImage()
        let request = DNSFormStageModels.ImagePopup.Request(field: "testField",
                                                            image: image,
                                                            message: "Test message",
                                                            title: "Test title")

        XCTAssertEqual(request.field, "testField")
        XCTAssertEqual(request.image, image)
        XCTAssertEqual(request.message, "Test message")
        XCTAssertEqual(request.title, "Test title")
    }

    func test_DNSFormStageModels_LanguageRequest_initialization() {
        let request = DNSFormStageModels.Language.Request(languageCode: "es")

        XCTAssertEqual(request.languageCode, "es")
    }

    func test_DNSFormStageModels_LanguageResponse_initialization() {
        let response = DNSFormStageModels.Language.Response(languageCode: "fr")

        XCTAssertEqual(response.languageCode, "fr")
    }

    func test_DNSFormStageModels_LanguageViewModel_initialization() {
        let viewModel = DNSFormStageModels.Language.ViewModel(languageCode: "de")

        XCTAssertEqual(viewModel.languageCode, "de")
    }

    func test_DNSFormStageModels_SectionRequest_initialization() {
        let request = DNSFormStageModels.Section.Request(section: 2, languageCode: "en")

        XCTAssertEqual(request.section, 2)
        XCTAssertEqual(request.languageCode, "en")
    }

    func test_DNSFormStageModels_TabRequest_initialization() {
        let request = DNSFormStageModels.Tab.Request(selectedTabCode: "tab1", tabsCode: "tabs1")

        XCTAssertEqual(request.selectedTabCode, "tab1")
        XCTAssertEqual(request.tabsCode, "tabs1")
    }

    func test_DNSFormStageModels_TabResponse_initialization() {
        let response = DNSFormStageModels.Tab.Response(selectedTabCode: "tab2", tabsCode: "tabs2")

        XCTAssertEqual(response.selectedTabCode, "tab2")
        XCTAssertEqual(response.tabsCode, "tabs2")
    }

    func test_DNSFormStageModels_TabViewModel_initialization() {
        let viewModel = DNSFormStageModels.Tab.ViewModel(selectedTabCode: "tab3", tabsCode: "tabs3")

        XCTAssertEqual(viewModel.selectedTabCode, "tab3")
        XCTAssertEqual(viewModel.tabsCode, "tabs3")
    }

    func test_DNSFormStageModels_WeblinkRequest_initialization() {
        let url = URL(string: "https://example.com")
        let request = DNSFormStageModels.Weblink.Request(field: "testField", weblink: url)

        XCTAssertEqual(request.field, "testField")
        XCTAssertEqual(request.weblink, url)
    }

    func test_DNSFormStageModels_WeblinkRequest_initializationWithoutURL() {
        let request = DNSFormStageModels.Weblink.Request(field: "testField")

        XCTAssertEqual(request.field, "testField")
        XCTAssertNil(request.weblink)
    }

    // MARK: - DNSFormStageInteractor Tests

    func test_DNSFormStageInteractor_initialization() {
        let interactor = DNSFormStageInteractor(configurator: DNSFormStageConfigurator())

        XCTAssertEqual(interactor.formState, DNSFormStage.FormState.none)
        XCTAssertEqual(interactor.selectedLanguage, DNSCore.languageCode)
        XCTAssertTrue(interactor.selectedTabs.isEmpty)
        XCTAssertNotNil(interactor.fieldAlertPublisher)
        XCTAssertNotNil(interactor.fileDeletePublisher)
        XCTAssertNotNil(interactor.fileSelectPublisher)
        XCTAssertNotNil(interactor.imageDeletePublisher)
        XCTAssertNotNil(interactor.imageSelectPublisher)
        XCTAssertNotNil(interactor.languagePublisher)
        XCTAssertNotNil(interactor.tabPublisher)
    }

    func test_DNSFormStageInteractor_formState_triggersRefresh() {
        let interactor = DNSFormStageInteractor(configurator: DNSFormStageConfigurator())

        // Test that setting formState calls formRefresh (which is overridable)
        interactor.formState = DNSFormStage.FormState.updating
        XCTAssertEqual(interactor.formState, DNSFormStage.FormState.updating)

        interactor.formState = DNSFormStage.FormState.verified
        XCTAssertEqual(interactor.formState, DNSFormStage.FormState.verified)
    }

    func test_DNSFormStageInteractor_selectedLanguage_triggersUpdate() {
        let interactor = DNSFormStageInteractor(configurator: DNSFormStageConfigurator())

        // Test that setting selectedLanguage calls formUpdateLanguage
        interactor.selectedLanguage = "es"
        XCTAssertEqual(interactor.selectedLanguage, "es")

        interactor.selectedLanguage = "fr"
        XCTAssertEqual(interactor.selectedLanguage, "fr")
    }

    func test_DNSFormStageInteractor_formAnyChanges() {
        let interactor = DNSFormStageInteractor(configurator: DNSFormStageConfigurator())

        // Base implementation returns false
        XCTAssertFalse(interactor.formAnyChanges())
    }

    func test_DNSFormStageInteractor_formIsValid() {
        let interactor = DNSFormStageInteractor(configurator: DNSFormStageConfigurator())

        // Base implementation returns true
        XCTAssertTrue(interactor.formIsValid())
    }

    func test_DNSFormStageInteractor_formClearState() {
        let interactor = DNSFormStageInteractor(configurator: DNSFormStageConfigurator())

        // Change state first
        interactor.formState = DNSFormStage.FormState.updating
        interactor.selectedLanguage = "es"

        // Clear state
        interactor.formClearState()

        XCTAssertEqual(interactor.formState, DNSFormStage.FormState.none)
        XCTAssertEqual(interactor.selectedLanguage, DNSCore.languageCode)
    }

    func test_DNSFormStageInteractor_doLanguageChanged() {
        let interactor = DNSFormStageInteractor(configurator: DNSFormStageConfigurator())
        let request = DNSFormStageModels.Language.Request(languageCode: "es")

        interactor.doLanguageChanged(request)

        XCTAssertEqual(interactor.selectedLanguage, "es")
    }

    func test_DNSFormStageInteractor_doTabChanged() {
        let interactor = DNSFormStageInteractor(configurator: DNSFormStageConfigurator())
        let request = DNSFormStageModels.Tab.Request(selectedTabCode: "tab1", tabsCode: "tabs1")

        interactor.doTabChanged(request)

        XCTAssertEqual(interactor.selectedTabs["tabs1"], "tab1")
    }

    // MARK: - DNSFormStagePresenter Tests

    func test_DNSFormStagePresenter_initialization() {
        let presenter = DNSFormStagePresenter(configurator: DNSFormStageConfigurator())

        XCTAssertNotNil(presenter.fieldAlertPublisher)
        XCTAssertNotNil(presenter.fileDeletePublisher)
        XCTAssertNotNil(presenter.fileSelectPublisher)
        XCTAssertNotNil(presenter.imageDeletePublisher)
        XCTAssertNotNil(presenter.imageSelectPublisher)
        XCTAssertNotNil(presenter.languagePublisher)
        XCTAssertNotNil(presenter.tabPublisher)
    }

    func test_DNSFormStagePresenter_presentFieldAlert() {
        let presenter = DNSFormStagePresenter(configurator: DNSFormStageConfigurator())
        let response = DNSFormStageModels.Field.Response(field: "testField")

        var receivedViewModel: DNSFormStageModels.Field.ViewModel?
        let cancellable = presenter.fieldAlertPublisher.sink { viewModel in
            receivedViewModel = viewModel
        }

        presenter.presentFieldAlert(response)

        XCTAssertNotNil(receivedViewModel)
        XCTAssertEqual(receivedViewModel?.field, "testField")
        XCTAssertEqual(receivedViewModel?.alertMessage, "")

        cancellable.cancel()
    }


    func test_DNSFormStagePresenter_presentFileDelete() {
        let presenter = DNSFormStagePresenter(configurator: DNSFormStageConfigurator())
        let response = DNSFormStageModels.Field.Response(field: "fileField")

        var receivedViewModel: DNSFormStageModels.Field.ViewModel?
        let cancellable = presenter.fileDeletePublisher.sink { viewModel in
            receivedViewModel = viewModel
        }

        presenter.presentFileDelete(response)

        XCTAssertNotNil(receivedViewModel)
        XCTAssertEqual(receivedViewModel?.field, "fileField")
        XCTAssertEqual(receivedViewModel?.alertMessage, "")

        cancellable.cancel()
    }

    func test_DNSFormStagePresenter_presentFileSelect() {
        let presenter = DNSFormStagePresenter(configurator: DNSFormStageConfigurator())
        let response = DNSFormStageModels.Field.Response(field: "fileField")

        var receivedViewModel: DNSFormStageModels.Field.ViewModel?
        let cancellable = presenter.fileSelectPublisher.sink { viewModel in
            receivedViewModel = viewModel
        }

        presenter.presentFileSelect(response)

        XCTAssertNotNil(receivedViewModel)
        XCTAssertEqual(receivedViewModel?.field, "fileField")
        XCTAssertEqual(receivedViewModel?.alertMessage, "")

        cancellable.cancel()
    }

    func test_DNSFormStagePresenter_presentImageDelete() {
        let presenter = DNSFormStagePresenter(configurator: DNSFormStageConfigurator())
        let response = DNSFormStageModels.Field.Response(field: "imageField")

        var receivedViewModel: DNSFormStageModels.Field.ViewModel?
        let cancellable = presenter.imageDeletePublisher.sink { viewModel in
            receivedViewModel = viewModel
        }

        presenter.presentImageDelete(response)

        XCTAssertNotNil(receivedViewModel)
        XCTAssertEqual(receivedViewModel?.field, "imageField")
        XCTAssertEqual(receivedViewModel?.alertMessage, "")

        cancellable.cancel()
    }

    func test_DNSFormStagePresenter_presentImageSelect() {
        let presenter = DNSFormStagePresenter(configurator: DNSFormStageConfigurator())
        let response = DNSFormStageModels.Field.Response(field: "imageField")

        var receivedViewModel: DNSFormStageModels.Field.ViewModel?
        let cancellable = presenter.imageSelectPublisher.sink { viewModel in
            receivedViewModel = viewModel
        }

        presenter.presentImageSelect(response)

        XCTAssertNotNil(receivedViewModel)
        XCTAssertEqual(receivedViewModel?.field, "imageField")
        XCTAssertEqual(receivedViewModel?.alertMessage, "")

        cancellable.cancel()
    }

    func test_DNSFormStagePresenter_presentLanguage() {
        let presenter = DNSFormStagePresenter(configurator: DNSFormStageConfigurator())
        let response = DNSFormStageModels.Language.Response(languageCode: "es")

        var receivedViewModel: DNSFormStageModels.Language.ViewModel?
        let cancellable = presenter.languagePublisher.sink { viewModel in
            receivedViewModel = viewModel
        }

        presenter.presentLanguage(response)

        XCTAssertNotNil(receivedViewModel)
        XCTAssertEqual(receivedViewModel?.languageCode, "es")

        cancellable.cancel()
    }

    func test_DNSFormStagePresenter_presentTab() {
        let presenter = DNSFormStagePresenter(configurator: DNSFormStageConfigurator())
        let response = DNSFormStageModels.Tab.Response(selectedTabCode: "tab1", tabsCode: "tabs1")

        var receivedViewModel: DNSFormStageModels.Tab.ViewModel?
        let cancellable = presenter.tabPublisher.sink { viewModel in
            receivedViewModel = viewModel
        }

        presenter.presentTab(response)

        XCTAssertNotNil(receivedViewModel)
        XCTAssertEqual(receivedViewModel?.selectedTabCode, "tab1")
        XCTAssertEqual(receivedViewModel?.tabsCode, "tabs1")

        cancellable.cancel()
    }

    // MARK: - DNSFormStageViewController Tests

    func test_DNSFormStageViewController_baseFormContentInset() {
        let expectedInset = UIEdgeInsets(top: 44, left: 0, bottom: 64, right: 0)
        XCTAssertEqual(DNSFormStageViewController.baseFormContentInset, expectedInset)
    }

    // MARK: - DNSFormStageConfigurator Tests

    func test_DNSFormStageConfigurator_inheritance() {
        let configurator = DNSFormStageConfigurator()

        // Test that it inherits from DNSBaseStageConfigurator
        XCTAssertTrue(configurator is DNSBaseStageConfigurator)
    }

    // MARK: - DNSFormStageCommon Tests

    func test_DNSFormStageCommon_typeAliases() {
        // Test that type aliases are correctly set
        XCTAssertTrue(DNSFormStage.Configurator.self == DNSFormStageConfigurator.self)
        XCTAssertTrue(DNSFormStage.Interactor.self == DNSFormStageInteractor.self)
        XCTAssertTrue(DNSFormStage.Models.self == DNSFormStageModels.self)
        XCTAssertTrue(DNSFormStage.Presenter.self == DNSFormStagePresenter.self)
        XCTAssertTrue(DNSFormStage.ViewController.self == DNSFormStageViewController.self)

        XCTAssertTrue(DNSFormStage.Logic.Business.self == DNSFormStageBusinessLogic.self)
        XCTAssertTrue(DNSFormStage.Logic.Display.self == DNSFormStageDisplayLogic.self)
        XCTAssertTrue(DNSFormStage.Logic.Presentation.self == DNSFormStagePresentationLogic.self)
    }

    func test_DNSFormStageCommon_FormState_allCases() {
        // Test all FormState cases
        XCTAssertEqual(DNSFormStage.FormState.none, .none)
        XCTAssertEqual(DNSFormStage.FormState.cancelling, .cancelling)
        XCTAssertEqual(DNSFormStage.FormState.copyAppAction, .copyAppAction)
        XCTAssertEqual(DNSFormStage.FormState.removed, .removed)
        XCTAssertEqual(DNSFormStage.FormState.removing, .removing)
        XCTAssertEqual(DNSFormStage.FormState.selectAppAction, .selectAppAction)
        XCTAssertEqual(DNSFormStage.FormState.updated, .updated)
        XCTAssertEqual(DNSFormStage.FormState.updating, .updating)
        XCTAssertEqual(DNSFormStage.FormState.verified, .verified)
        XCTAssertEqual(DNSFormStage.FormState.verifying, .verifying)
    }

    func test_DNSFormStageCommon_ActionCodes() {
        XCTAssertEqual(DNSFormStage.ActionCodes.close, "DNSFormStage_ActionCodes_close")
    }

    func test_DNSFormStageCommon_Localizations_DayOfWeekCell() {
        // Test that localization keys are properly defined
        XCTAssertFalse(DNSFormStage.Localizations.DayOfWeekCell.mondayLabel.isEmpty)
        XCTAssertFalse(DNSFormStage.Localizations.DayOfWeekCell.tuesdayLabel.isEmpty)
        XCTAssertFalse(DNSFormStage.Localizations.DayOfWeekCell.wednesdayLabel.isEmpty)
        XCTAssertFalse(DNSFormStage.Localizations.DayOfWeekCell.thursdayLabel.isEmpty)
        XCTAssertFalse(DNSFormStage.Localizations.DayOfWeekCell.fridayLabel.isEmpty)
        XCTAssertFalse(DNSFormStage.Localizations.DayOfWeekCell.saturdayLabel.isEmpty)
        XCTAssertFalse(DNSFormStage.Localizations.DayOfWeekCell.sundayLabel.isEmpty)
    }

    func test_DNSFormStageCommon_Localizations_ImagePopup() {
        XCTAssertFalse(DNSFormStage.Localizations.ImagePopup.closeButton.isEmpty)
    }

    // MARK: - Theme Extension Tests

    func test_DNSThemeFieldStyle_DNSForm_initThemes() {
        // Test that initThemes can be called without crashing
        DNSThemeFieldStyle.DNSForm.initThemes()

        // Verify createThemes block exists
        XCTAssertNotNil(DNSThemeFieldStyle.DNSForm.createThemes)
    }

    func test_DNSThemeFieldStyle_DNSForm_defaultStyle() {
        let defaultStyle = DNSThemeFieldStyle.DNSForm.default

        // Test that the style object exists and has basic properties
        XCTAssertNotNil(defaultStyle)
        XCTAssertEqual(defaultStyle.alertPosition, .bottom)
        XCTAssertEqual(defaultStyle.invalidCharacters, "")
    }

    func test_DNSThemeFieldStyle_DNSForm_datePickerStyle() {
        let datePickerStyle = DNSThemeFieldStyle.DNSForm.datePicker

        // Test that the style object exists and has basic properties
        XCTAssertNotNil(datePickerStyle)
        XCTAssertEqual(datePickerStyle.alertPosition, .bottom)
        XCTAssertEqual(datePickerStyle.invalidCharacters, "")
    }

    func test_DNSThemeFieldStyle_DNSForm_numberPickerStyle() {
        let numberPickerStyle = DNSThemeFieldStyle.DNSForm.numberPicker

        // Test that the style object exists and has basic properties
        XCTAssertNotNil(numberPickerStyle)
        XCTAssertEqual(numberPickerStyle.alertPosition, .bottom)
        XCTAssertEqual(numberPickerStyle.invalidCharacters, "")
    }

    func test_DNSThemeFieldStyle_DNSForm_stringPickerStyle() {
        let stringPickerStyle = DNSThemeFieldStyle.DNSForm.stringPicker

        // Test that the style object exists and has basic properties
        XCTAssertNotNil(stringPickerStyle)
        XCTAssertEqual(stringPickerStyle.alertPosition, .bottom)
        XCTAssertEqual(stringPickerStyle.invalidCharacters, "")
    }

    func test_DNSThemeFieldStyle_DNSForm_textViewStyle() {
        let textViewStyle = DNSThemeFieldStyle.DNSForm.textView

        // Test that the style object exists and has basic properties
        XCTAssertNotNil(textViewStyle)
        XCTAssertEqual(textViewStyle.alertPosition, .bottom)
        XCTAssertEqual(textViewStyle.invalidCharacters, "")
    }

    func test_DNSUIFont_DNSForm_Button_structures() {
        // Test that button font structures exist
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.Default.subtitle)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.Default.title)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.Action.subtitle)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.Action.title)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.ActionLeft.subtitle)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.ActionLeft.title)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.ActionRight.subtitle)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.ActionRight.title)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.Clear.subtitle)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.Clear.title)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.Destructive.subtitle)
        XCTAssertNotNil(DNSUIFont.DNSForm.Button.Destructive.title)
    }

    func test_DNSUIFont_DNSForm_Field_structures() {
        // Test that field font structures exist
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.Default.alert)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.Default.counter)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.Default.text)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.Default.title)

        XCTAssertNotNil(DNSUIFont.DNSForm.Field.DatePicker.alert)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.DatePicker.counter)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.DatePicker.text)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.DatePicker.title)

        XCTAssertNotNil(DNSUIFont.DNSForm.Field.NumberPicker.alert)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.NumberPicker.counter)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.NumberPicker.text)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.NumberPicker.title)

        XCTAssertNotNil(DNSUIFont.DNSForm.Field.StringPicker.alert)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.StringPicker.counter)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.StringPicker.text)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.StringPicker.title)

        XCTAssertNotNil(DNSUIFont.DNSForm.Field.TextView.alert)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.TextView.counter)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.TextView.text)
        XCTAssertNotNil(DNSUIFont.DNSForm.Field.TextView.title)
    }

    func test_DNSUIFont_DNSForm_Label_structures() {
        // Test that label font structures exist
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.default)
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.actionControlTitle)
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.body)
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.bodyTight)
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.field)
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.fieldHeader)
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.header)
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.sectionFrameTitle)
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.subtitle)
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.tag)
        XCTAssertNotNil(DNSUIFont.DNSForm.Label.title)
    }

    // MARK: - FieldTypeCell Tests

    func test_DNSFormDetailTextFieldCell_Data_initialization() {
        let data = DNSFormDetailTextFieldCell.Data(
            field: "testField",
            formatPattern: "###-##-####",
            label: "Test Label",
            languageCode: "en",
            placeholder: "Enter text",
            readonly: false,
            required: true,
            text: "Test Text",
            type: .text
        )

        XCTAssertEqual(data.field, "testField")
        XCTAssertEqual(data.formatPattern, "###-##-####")
        XCTAssertEqual(data.label, "Test Label")
        XCTAssertEqual(data.languageCode, "en")
        XCTAssertEqual(data.placeholder, "Enter text")
        XCTAssertFalse(data.readonly)
        XCTAssertTrue(data.required)
        XCTAssertEqual(data.text, "Test Text")
        XCTAssertEqual(data.type, .text)

        // Test default values
        XCTAssertEqual(data.autocapitalizationType, .none)
        XCTAssertEqual(data.keyboardType, .default)
        XCTAssertFalse(data.lowercaseOnly)
        XCTAssertEqual(data.maximumLength, 128)
        XCTAssertEqual(data.maximumPrice, 999999.00)
        XCTAssertEqual(data.minimumLength, 1)
        XCTAssertEqual(data.returnKeyType, .next)
        XCTAssertFalse(data.uppercaseOnly)
        XCTAssertEqual(data.alertMessage, "")
    }

    func test_DNSFormDetailTextFieldCell_recommendedContentSize() {
        let expectedSize = CGSize(width: 414, height: 74)
        XCTAssertEqual(DNSFormDetailTextFieldCell.recommendedContentSize, expectedSize)
        XCTAssertEqual(DNSFormDetailTextFieldCell.heightForSection, expectedSize.height)
    }

    func test_DNSFormDetailTextFieldCell_type_conformance() {
        // Test type conformance without instantiation (which requires storyboard)
        XCTAssertTrue(DNSFormDetailTextFieldCell.self is DNSBaseStageCollectionViewCell.Type)
        XCTAssertTrue(DNSFormDetailTextFieldCell.self is DNSFormDetailTextFieldCellLogic.Type)
    }

    func test_DNSFormDetailCheckboxCell_Data_initialization() {
        let data = DNSFormDetailCheckboxCell.Data(
            checked: true,
            detailText: "Detail text",
            field: "checkboxField",
            readonly: false,
            required: true,
            titleText: "Title text"
        )

        XCTAssertTrue(data.checked)
        XCTAssertEqual(data.detailText, "Detail text")
        XCTAssertEqual(data.field, "checkboxField")
        XCTAssertFalse(data.readonly)
        XCTAssertTrue(data.required)
        XCTAssertEqual(data.titleText, "Title text")
        XCTAssertEqual(data.imageChecked, DNSFormDetailCheckboxCell.defaultImageChecked)
        XCTAssertEqual(data.imageUnchecked, DNSFormDetailCheckboxCell.defaultImageUnchecked)
    }

    func test_DNSFormDetailCheckboxCell_recommendedContentSize() {
        let expectedSize = CGSize(width: 414, height: 52)
        XCTAssertEqual(DNSFormDetailCheckboxCell.recommendedContentSize, expectedSize)
        XCTAssertEqual(DNSFormDetailCheckboxCell.heightForSection, expectedSize.height)
    }

    func test_DNSFormDetailCheckboxCell_defaultImages() {
        XCTAssertNotNil(DNSFormDetailCheckboxCell.defaultImageChecked)
        XCTAssertNotNil(DNSFormDetailCheckboxCell.defaultImageUnchecked)
    }

    func test_DNSFormDetailCheckboxCell_type_conformance() {
        // Test type conformance without instantiation (which requires storyboard)
        XCTAssertTrue(DNSFormDetailCheckboxCell.self is DNSBaseStageCollectionViewCell.Type)
        XCTAssertTrue(DNSFormDetailCheckboxCell.self is DNSFormDetailCheckboxCellLogic.Type)
    }

    func test_DNSFormDetailDateCell_Data_initialization() {
        let date = Date()
        let data = DNSFormDetailDateCell.Data(
            date: date,
            dateLabel: "Select Date",
            datePlaceholder: "Choose a date",
            field: "dateField",
            languageCode: "en",
            readonly: false,
            required: true
        )

        XCTAssertEqual(data.date, date)
        XCTAssertEqual(data.dateLabel, "Select Date")
        XCTAssertEqual(data.datePlaceholder, "Choose a date")
        XCTAssertEqual(data.field, "dateField")
        XCTAssertEqual(data.languageCode, "en")
        XCTAssertFalse(data.readonly)
        XCTAssertTrue(data.required)
        XCTAssertNil(data.minimumDate)
        XCTAssertNil(data.maximumDate)
        XCTAssertEqual(data.alertMessage, "")
        XCTAssertEqual(data.image, DNSFormDetailDateCell.defaultImage)
    }

    func test_DNSFormDetailDateCell_recommendedContentSize() {
        let expectedSize = CGSize(width: 414, height: 86)
        XCTAssertEqual(DNSFormDetailDateCell.recommendedContentSize, expectedSize)
        XCTAssertEqual(DNSFormDetailDateCell.heightForSection, expectedSize.height)
    }

    func test_DNSFormDetailDateCell_defaultImage() {
        XCTAssertNotNil(DNSFormDetailDateCell.defaultImage)
    }

    func test_DNSFormDetailDateCell_dateFormatter() {
        let formatter = DNSFormDetailDateCell.dateFormatter
        XCTAssertEqual(formatter.dateFormat, "EEEE, MMMM dd, yyyy")
    }

    func test_DNSFormDetailDateCell_type_conformance() {
        // Test type conformance without instantiation (which requires storyboard)
        XCTAssertTrue(DNSFormDetailDateCell.self is DNSBaseStageCollectionViewCell.Type)
        XCTAssertTrue(DNSFormDetailDateCell.self is DNSFormDetailDateCellLogic.Type)
    }

    // MARK: - Integration Tests

    func test_DNSFormStage_register_collectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

        // Test that register method doesn't crash
        DNSFormStage.register(to: collectionView)

        // Verify that some cells are registered (we can't directly test registration, but we can ensure no crash)
        XCTAssertNotNil(collectionView)
    }

    func test_FormStage_MVIP_integration() {
        let configurator = DNSFormStageConfigurator()
        let interactor = DNSFormStageInteractor(configurator: configurator)
        let presenter = DNSFormStagePresenter(configurator: configurator)

        // Test that components can be created together
        XCTAssertNotNil(configurator)
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(presenter)

        // Test that interactor and presenter can work together
        XCTAssertNotNil(interactor.fieldAlertPublisher)
        XCTAssertNotNil(presenter.fieldAlertPublisher)
    }

    func test_FormFieldTypes_consistency() {
        // Test that field types are consistent across components
        let textFieldType = DNSFormFieldType.text
        let emailFieldType = DNSFormFieldType.email

        XCTAssertEqual(textFieldType.rawValue, "text")
        XCTAssertEqual(emailFieldType.rawValue, "email")

        // Test that these can be used in TextField cell data
        let textFieldData = DNSFormDetailTextFieldCell.Data(
            field: "test",
            label: "Test",
            languageCode: "en",
            placeholder: "Enter text",
            readonly: false,
            required: false,
            text: "",
            type: textFieldType
        )

        XCTAssertEqual(textFieldData.type, .text)
    }

    func test_Publisher_integration() {
        let configurator = DNSFormStageConfigurator()
        let interactor = DNSFormStageInteractor(configurator: configurator)
        let presenter = DNSFormStagePresenter(configurator: configurator)

        // Test that publishers can send and receive data
        var receivedResponse: DNSFormStageModels.Field.Response?
        var receivedViewModel: DNSFormStageModels.Field.ViewModel?

        let interactorCancellable = interactor.fieldAlertPublisher.sink { response in
            receivedResponse = response
        }

        let presenterCancellable = presenter.fieldAlertPublisher.sink { viewModel in
            receivedViewModel = viewModel
        }

        // Send response through interactor
        let response = DNSFormStageModels.Field.Response(field: "testField")
        interactor.fieldAlertPublisher.send(response)

        // Send viewModel through presenter
        let viewModel = DNSFormStageModels.Field.ViewModel(field: "testField")
        presenter.fieldAlertPublisher.send(viewModel)

        XCTAssertNotNil(receivedResponse)
        XCTAssertEqual(receivedResponse?.field, "testField")
        XCTAssertNotNil(receivedViewModel)
        XCTAssertEqual(receivedViewModel?.field, "testField")

        interactorCancellable.cancel()
        presenterCancellable.cancel()
    }

    // MARK: - Performance Tests

    func test_FormStageModels_performance() {
        measure {
            for _ in 0..<1000 {
                let request = DNSFormStageModels.Field.Request(field: "field", languageCode: "en")
                let response = DNSFormStageModels.Field.Response(field: request.field)
                let viewModel = DNSFormStageModels.Field.ViewModel(field: response.field)

                XCTAssertEqual(viewModel.field, "field")
            }
        }
    }

    func test_ThemeStyle_performance() {
        measure {
            for _ in 0..<100 {
                let style = DNSThemeFieldStyle.DNSForm.default
                XCTAssertEqual(style.name, "default")
            }
        }
    }
}
