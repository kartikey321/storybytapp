import { Story, StoryModel } from "../interfaces";
class StoryService {
  async createStory(map: Record<string, any>) {
    let story: Story = Story.fromMap(map);
    let newStory: Story = new StoryModel(story);
    var data = await newStory.save();
  }
  async getStory(id: string): Promise<Story | null> {
    return await StoryModel.findById(id);
  }
}

export default new StoryService();
