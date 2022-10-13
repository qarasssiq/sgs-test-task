<template>
  <div class="container mt-4">
    <div class="row">
      <div class="col-sm-6 mx-auto">
        <form @submit="submit">
          <SelectComponent
              label-name="Город"
              v-model=selectedCity
              :options=cities
              @change="selectedEmployee = null"
          />
          <SelectComponent
              label-name="Цех"
              v-model=selectedWorkshop
              :options=workshops[selectedCity?.id]
          />
          <SelectComponent
              label-name="Сотрудник"
              v-model=selectedEmployee
              :options=employees[selectedWorkshop?.id]
          />
          <SelectComponent
              label-name="Бригада"
              v-model=selectedBrigade
              :options=brigades
          />
          <SelectComponent
              label-name="Смена"
              v-model=selectedShift
              :options=shifts
          />
          <button class="btn btn-primary" id="submit" type="submit">Подтвердить</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
  //import $ from "jquery";

  import SelectComponent from "@/components/SelectComponent";
  export default {
    components: {SelectComponent},
    data() {
      return {
        selectedCity: null,
        selectedWorkshop: null,
        selectedEmployee: null,
        selectedBrigade: null,
        selectedShift: null,

        cities: [
          { name: "Москва", id: 1 },
          { name: "Санкт-Петербург", id: 2 },
          { name: "Самара", id: 3 },
          { name: "Казань", id: 4 }
        ],

        workshops: {
          1: [{ name: "Цех №1", id: 1 }, { name: "Цех №2", id: 2 }],
          2: [{ name: "Цех №3", id: 3 }, { name: "Цех №4", id: 4 }],
          3: [{ name: "Цех №5", id: 5 }, { name: "Цех №6", id: 6 }],
          4: [{ name: "Цех №7", id: 7 }, { name: "Цех №8", id: 8 }]
        },

        employees: {
          1: [{ name: "Столяров Сергей Ярославович", id: 1}, { name: "Дорофеева Милана Святославовна", id: 2 }],
          2: [{ name: "Агафонов Максим Романович", id: 3 }, { name: "Тарасов Егор Борисович", id: 4 }],
          3: [{ name: "Яковлев Кирилл Даниилович", id: 5 }, { name: "Егоров Семён Вадимович", id: 6 }],
          4: [{ name: "Акимова София Владиславовна", id: 7 }, { name: "Яковлева Анна Марковна", id: 8 }],
          5: [{ name: "Вишневский Андрей Егорович", id: 9 }, { name: "Самсонова Мирослава Дмитриевна", id: 10 }],
          6: [{ name: "Анисимов Сергей Дмитриевич", id: 11 }, { name: "Большакова Мадина Артемьевна", id: 12 }],
          7: [{ name: "Малинина Дарина Александровна", id: 13 }, { name: "Антипов Максим Алексеевич", id: 14 }],
          8: [{ name: "Широков Макар Константинович", id: 15 }, { name: "Родионова Мадина Сергеевна", id: 16 }]
        },

        brigades: [
          { name: "Первая бригада", id: 1},
          { name: "Вторая бригада", id: 2}
        ],

        shifts: [
          { name: "Первая смена (с 08:00 до 20:00)", id: 1},
          { name: "Вторая смена (с 20:00 до 08:00)", id: 2}
        ],
      }
    },
    methods: {
      submit() {
        let dataToSave = {
          city: this.selectedCity.name,
          workshop: this.selectedWorkshop.name,
          employee: this.selectedEmployee.name,
          brigade: this.selectedBrigade.name,
          shift: this.selectedShift.name
        }
        document.cookie = 'data=' + JSON.stringify(dataToSave);

        alert(document.cookie);
      }
    }
  }
</script>

<style>

</style>
