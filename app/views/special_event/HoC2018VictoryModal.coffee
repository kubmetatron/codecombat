ModalComponent = require 'views/core/ModalComponent'
HoC2018VictoryComponent = require('./HoC2018VictoryModal.vue').default

module.exports = class HoC2018VictoryModal extends ModalComponent
  id: 'hoc-victory-modal'
  template: require 'templates/core/modal-base-flat'
  closeButton: true
  VueComponent: HoC2018VictoryComponent

  constructor: (options) ->
    super(options)
    if not options.shareURL
      throw new Error("HoC2018VictoryModal requires shareURL value.")
    if not options.campaign
      throw new Error("HoC2018VictoryModal requires campaign slug.")
    @propsData = {
      navigateCertificate: (name) => 
        console.log("routing: /certificates/#{me.id}/anon")
        application.router.navigate("/certificates/#{me.id}/anon?campaign=#{options.campaign}&username=#{name}", { trigger: true })
      ,
      shareURL: options.shareURL,
      fullName: if me.isAnonymous() then "" else me.broadName()
    }
